// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {ChallengeSix} from "src/buidlguidlCTFs/ChallengeSix.sol";

contract CTFSixTest is Test {
    function testCTFSix() public {
        ChallengeSix solver = new ChallengeSix();
        vm.prank(0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61);
        solver.solve();
    }
}
