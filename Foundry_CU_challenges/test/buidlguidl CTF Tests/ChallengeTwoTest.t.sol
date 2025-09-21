// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {ChallengeTwo} from "src/buidlguidlCTFs/ChallengeTwo.sol";

contract CTFTwoTest is Test {
    function testCTFTwo() public {
        ChallengeTwo solver = new ChallengeTwo();
        solver.solve();
    }
}
