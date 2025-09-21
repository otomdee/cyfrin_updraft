// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract ChallengeThree {
    constructor() {
        address challengeAddress = 0x03bF70f50fcF9420f27e31B47805bbd8f2f52571;

        bytes memory callData = abi.encodeWithSignature("mintFlag()");
        (bool success,) = challengeAddress.call(callData);
        success;
    }
}
