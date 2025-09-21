// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface Ichallenge {
    function mintFlag() external;
}

contract ChallengeEleven {
    address constant CHALLENGE = 0x67392ea0A56075239988B8E1E96663DAC167eF54;

    function solve() external {
        Ichallenge(CHALLENGE).mintFlag();
    }
}
