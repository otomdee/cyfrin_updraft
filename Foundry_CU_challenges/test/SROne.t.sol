// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";

contract SROne is Test {
    address challengeContract = 0xA2626bE06C11211A44fb6cA324A67EBDBCd30B70;

    function setUp() public {}

    function testSROneSolve() public {
        vm.prank(0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61);

        //gotten by reading challenge contract variable with "cast storage".
        //will have changed by the time you're reading this
        uint256 valueAtSlot = 479075;

        string memory twitterHandle = "@0x_Money";
        bytes memory callData = abi.encodeWithSignature("solveChallenge(uint256,string)", valueAtSlot, twitterHandle);
        (bool success,) = challengeContract.call(callData);
        success;
    }
}
