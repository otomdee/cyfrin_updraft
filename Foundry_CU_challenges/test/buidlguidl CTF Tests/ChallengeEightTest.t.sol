// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";

contract CTFEightTest is Test {
    function testCTFEight() public {
        address challenge = 0x663145aA2918282A4F96af66320A5046C7009573;

        address main = 0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61;

        bytes4 selector = 0x8fd628f0;
        bytes memory callData = abi.encodeWithSelector(selector, main);

        vm.prank(main);
        (bool success,) = challenge.call(callData);
        success;
    }
}
