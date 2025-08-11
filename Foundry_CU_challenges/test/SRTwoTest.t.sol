// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {SRTwo} from "../src/SRTwo.sol";

contract SRTwoTest is Test {
    SRTwo solver;

    function setUp() public {
        solver = new SRTwo();
    }

    function testSolveSRTwoChallenge() public {
        vm.prank(0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61);
        solver.solve();
    }
}
