// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    address USER = makeAddr("user");

    uint256 constant SEND_VALUE = 10e18;
    uint256 constant STARTING_BALANCE = 15e18;
    uint256 constant GAS_PRICE = 1;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testPriceFeedVersionIsAccurate() public view {
        assertEq(fundMe.getVersion(), 4);
    }

    function testFundFailsWithoutEnoughEth() public {
        vm.expectRevert();
        fundMe.fund();
    }

    modifier funded {
        vm.deal(USER, STARTING_BALANCE);
        vm.prank(USER); //the next tx will be sent by USER
        fundMe.fund{value: SEND_VALUE}();
        _;
    }

    function testFundUpdatesFundedDataStructure() public payable funded {

        assertEq(fundMe.getAddressToAmountFunded(USER), SEND_VALUE);
    }

    function testAddFunderToArrayOfFunders() public payable funded {
        address funder = fundMe.getFunder(0);

        assertEq(funder, USER);
    }

    function testOnlyOwnerCanWithdraw() public funded {
        vm.expectRevert();
        vm.prank(USER);
        fundMe.withdraw();
    }

    function testWithdrawWithASingleFunder() public funded {
        //Arrange
        uint256 ownerStartingBalance = fundMe.getOwner().balance;
        uint256 fundMeStartingBalance = address(fundMe).balance;
        //Act
        uint256 gasStart = gasleft();
        vm.txGasPrice(GAS_PRICE);
        vm.prank(fundMe.getOwner());
        fundMe.withdraw();

        uint256 gasEnd = gasleft();
        uint256 gasUsed = (gasStart - gasEnd) * tx.gasprice ;
        console.log(gasUsed);
        //Assert
        uint256 ownerEndingBalance = fundMe.getOwner().balance;
        uint256 fundMeEndingBalance = address(fundMe).balance;

        assertEq(fundMeEndingBalance, 0);
        assertEq(ownerStartingBalance + fundMeStartingBalance, ownerEndingBalance);
    }

    function testWithdrawWithMultipleFunders() public {
        //fund contract with multiple accounts
        //we're using uint160 because hoax only accepts that
        //starting index from 1 to prevent issues with the zero address
        uint160 numberOfFunders = 10;
        uint160 STARTING_INDEX = 1;

        for (uint160 i = STARTING_INDEX; i < numberOfFunders; i++) {
            hoax(address(i), STARTING_BALANCE);
            fundMe.fund{value: SEND_VALUE}();
        }

        uint256 ownerStartingBalance = fundMe.getOwner().balance;
        uint256 fundMeStartingBalance = address(fundMe).balance;

        vm.prank(fundMe.getOwner());
        fundMe.withdraw();

        uint256 ownerEndingBalance = fundMe.getOwner().balance;
        uint256 fundMeEndingBalance = address(fundMe).balance;
        //Assert
        assertEq(fundMeEndingBalance, 0);
        assertEq(ownerStartingBalance + fundMeStartingBalance, ownerEndingBalance);
    }

    function testWithdrawWithMultipleFundersCheaper() public {
        //fund contract with multiple accounts
        //we're using uint160 because hoax only accepts that
        //starting index from 1 to prevent issues with the zero address
        uint160 numberOfFunders = 10;
        uint160 STARTING_INDEX = 1;

        for (uint160 i = STARTING_INDEX; i < numberOfFunders; i++) {
            hoax(address(i), STARTING_BALANCE);
            fundMe.fund{value: SEND_VALUE}();
        }

        uint256 ownerStartingBalance = fundMe.getOwner().balance;
        uint256 fundMeStartingBalance = address(fundMe).balance;

        vm.prank(fundMe.getOwner());
        fundMe.cheaperWithdraw();

        uint256 ownerEndingBalance = fundMe.getOwner().balance;
        uint256 fundMeEndingBalance = address(fundMe).balance;
        //Assert
        assertEq(fundMeEndingBalance, 0);
        assertEq(ownerStartingBalance + fundMeStartingBalance, ownerEndingBalance);
    }
}
