// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {AdvancedNine} from "../src/AdvancedNine.sol";

contract AdvancedNineTest is Test {
    AdvancedNine myContract;
    address user = 0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61;
    address challengeContract = 0x766a74f8924C7B07df088fDB0F7D7DbaDd330Fb3;

    function setUp() public {
        myContract = new AdvancedNine();
    }

    function testSolveChallengeNine() public {
        vm.prank(user);

        string memory twitterHandle = "@0x_Money";
        bytes4 selector = AdvancedNine.setOtherVar.selector;
        console.logBytes4(selector);
        bytes memory callData = abi.encodeWithSignature(
            "solveChallenge(address,bytes4,string)", address(myContract), selector, twitterHandle
        );
        (bool success,) = challengeContract.call(callData);
        success;
    }
}
