// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";

contract ChallengeEightScript is Script {
    function run() public {
        vm.startBroadcast();
        address challenge = 0x663145aA2918282A4F96af66320A5046C7009573;
        address main = 0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61;

        bytes4 selector = 0x8fd628f0;
        bytes memory callData = abi.encodeWithSelector(selector, main);

        (bool success,) = challenge.call(callData);
        success;
        vm.stopBroadcast();
    }
}
