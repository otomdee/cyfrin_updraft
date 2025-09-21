// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface Ichallenge {
    function justCallMe() external;
}

contract ChallengeTwo {
    address private constant challengeAddress = 0x0b997E0a306c47EEc755Df75fad7F41977C5582d;

    function solve() external {
        Ichallenge(challengeAddress).justCallMe();
    }
}
