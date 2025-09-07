// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FlashLoanReceiver} from "src/SRFour.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SRFour is Test {
    FlashLoanReceiver attacker;
    address challengeContract = 0xcf4fbA490197452Bd414E16D563623253eFb57D3;
    address token = 0x155E8075c5c7Ba6FDdF29FDCE71147A3a384Ed36;
    uint256 public constant S6_NFT_COST = 2_000_000e18;

    function setUp() public {
        //deploy flashloan reciever
        attacker = new FlashLoanReceiver();
    }

    function testSRFourSolve() public {
        //do approval for solution contract
        vm.prank(address(attacker));
        IERC20(token).approve(challengeContract, S6_NFT_COST);

        //call flashloan
        attacker.takeLoan();
    }
}
