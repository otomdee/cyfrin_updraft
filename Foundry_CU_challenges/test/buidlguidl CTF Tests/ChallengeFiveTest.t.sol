// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {ChallengeFive} from "src/buidlguidlCTFs/ChallengeFive.sol";

interface Ichallenge {
    function mintFlag() external;
}

contract CTFFiveTest is Test {
    function testCTFFive() public {
        address main = 0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61;

        ChallengeFive solver = new ChallengeFive();

        vm.prank(main, main);
        //call solve
        solver.solveChallenge();

        //mint nft
        vm.prank(main, main);
        Ichallenge(0xB76AdFe9a791367A8fCBC2FDa44cB1a2c39D8F59).mintFlag();
    }
}
