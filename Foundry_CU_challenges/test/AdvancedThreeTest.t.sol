// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {AdvancedThree} from "../src/AdvancedThree.sol";
import {LessonTwelveHelper} from "../src/HellContract.sol";

contract AdvancedThreeTest is Test {
    AdvancedThree myContract;
    address user = makeAddr("user");
    address challengeContract = 0x643315C9Be056cDEA171F4e7b2222a4ddaB9F88D;
    LessonTwelveHelper hellContract;

    function setUp() public {
        myContract = new AdvancedThree();
        vm.prank(user);
        hellContract = new LessonTwelveHelper();
    }

    function testSolveChallengeContract() public {
        vm.prank(user);

        string memory twitterHandle = "@0x_Money";
        bytes memory callData =
            abi.encodeWithSignature("solveChallenge(address,string)", address(myContract), twitterHandle);
        (bool success,) = challengeContract.call(callData);
        success;
    }
}
