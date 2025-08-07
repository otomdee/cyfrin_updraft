// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {AdvancedSix} from "../src/AdvancedSix.sol";

interface YourContract {
    function owner() external view returns (address);
    function getNumber() external view returns (int256);
}

contract AdvancedSixTest is Test {
    address challengeContract = 0xaFa4150818b7843345A5E54E430Bd0cAE31B5c0C;
    AdvancedSix myContract;

    uint256 myValue = 2;

    function setUp() external {
        myContract = new AdvancedSix();
    }

    function testSolveSixChallenge() public {
        vm.prank(0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61);

        string memory twitterHandle = "@0x_Money";
        bytes memory callData =
            abi.encodeWithSignature("solveChallenge(address,string)", address(myContract), twitterHandle);
        (bool success,) = challengeContract.call(callData);
        success;
    }

    function testHelper() public view {
        console.log(addTen(0));
    }

    //this works fine :)
    function addTen(int256 number) public view returns (int256) {
        unchecked {
            return number + int256(myValue) + int256(10);
        }
    }
}
