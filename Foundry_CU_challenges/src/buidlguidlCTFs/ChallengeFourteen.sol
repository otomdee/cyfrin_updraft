// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Ichallenge {
    function mintFlag(bytes32) external;
}

contract ChallengeFourteen {
    address constant CHALLENGE = 0xFB4b32A60b975546Ed2959638B94259853F6a4b5;

    function solve() external {
        bytes32 key = keccak256(abi.encodePacked(address(this), CHALLENGE));

        Ichallenge(CHALLENGE).mintFlag(key);
    }
}
