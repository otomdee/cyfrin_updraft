// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

interface Ichallenge {
    function mintFlag(bytes32 _password) external;
}

contract ChallengeNineScript is Script {
    address constant CHALLENGE = 0x1Fd913F2250ae5A4d9F8881ADf3153C6e5E2cBb1;

    function run() external {
        vm.startBroadcast();

        uint256 count = 26;
        bytes32 password = 0xf6bd6ed5c530908225e7ea1ac072bde94b180a706c43bb253d3efd7ecb17ff3b;

        bytes32 mask = ~(bytes32(uint256(0xFF) << ((31 - (count % 32)) * 8)));
        bytes32 newPassword = password & mask;

        Ichallenge(CHALLENGE).mintFlag(newPassword);
        vm.stopBroadcast();
    }
}
