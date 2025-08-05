// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundamentalsFour} from "../src/FundamentalsFour.sol";

contract FourTest is Test {
    FundamentalsFour myContract;
    address user = makeAddr("user");

    function setUp() public {
        myContract = new FundamentalsFour();
    }

    function testCheckRevertResult() public {
        vm.prank(user);
        myContract.solve(0x33e1fD270599188BB1489a169dF1f0be08b83509);
    }
}
