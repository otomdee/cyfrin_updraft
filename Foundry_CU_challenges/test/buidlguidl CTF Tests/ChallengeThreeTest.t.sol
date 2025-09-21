// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {ChallengeThree} from "src/buidlguidlCTFs/ChallengeThree.sol";

contract CTFThreeTest is Test {
    function testCTFThree() public {
        address main = 0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61;
        //prank(msg.sender, tx.origin)
        vm.prank(main, main);
        new ChallengeThree();
    }
}
