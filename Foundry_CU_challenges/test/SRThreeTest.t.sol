// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";

contract SRThree is Test {
    //these addresses are unique, updated each time the challenge is solved
    address challengeContract = 0xdeB8d8eFeF7049E280Af1d5FE3a380F3BE93B648;
    address s_pool = 0x028EB6128D3ee626bFF5B17532b0FB8064600033;
    address tokenA = 0x7fE3B3E023a1907ef84B7E6F6e2E5EEA0B738d9c;
    address tokenB = 0xE516fa20e8F28296d43878acb7A0BF9FEe3Bcff4;

    function setUp() public {}

    function testSRThreeSolve() public {
        //protocol description:
        //S5Pool: stablecoin dex, swaps 1:1 tokens. tripool, not dual
        //LPers should only earn fees, no losses should be possible
        //this is the invariant of S5Pool:
        //the sum of tokens withdrawn should never be less than the sum deposited.
        //possible break guesses - owner withdrawal, other LP withdrawal
        //[issue] swapFrom seems to take and return the same amount when interacting with the user.
        //
        //fees - 0.1% to LPs. (* 999 / 1000), and 0.1% to Owner.
        //owner fees are tracked with s_ownerFee and can be withdrawn at any time
        //S5tokens get minted when you deposit all 3 tokens, and burnt when you withdraw

        //test:
        //NOTE: i have manually minted 1 each of tokenA and tokenB already,
        //then made some swaps to update owner fees, and called collectOwnerFees on the pool to break the invariant

        string memory twitterHandle = "@0x_Money";
        bytes memory callData = abi.encodeWithSignature("solveChallenge(string)", twitterHandle);
        (bool success,) = challengeContract.call(callData);
        success;
    }
}
