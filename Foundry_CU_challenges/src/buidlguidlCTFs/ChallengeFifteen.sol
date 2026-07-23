// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Ichallenge {
    function mintFlag() external;
}

contract ChallengeFifteen {
    address constant CHALLENGE = 0x2736fD9B1a87cb84f9e3278623AC117f11cD4655;

    function accessKey() external pure returns (string memory) {
        return ("LET_ME_IN");
    }

    function solve() external {
        Ichallenge(CHALLENGE).mintFlag();
    }
}
