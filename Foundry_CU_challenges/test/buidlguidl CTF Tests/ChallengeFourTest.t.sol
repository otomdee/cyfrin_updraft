// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

interface Ichallenge {
    function mintFlag(address _minter, bytes memory signature) external;
}

contract CTFFourTest is Test {
    using MessageHashUtils for bytes32;
    using ECDSA for bytes32;

    function testCTFFour() public pure {
        address main = 0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61;

        //to get owner wallet from deploy script,
        //string memory mnemonic = "test test test test test test test test test test test junk";
        //combine this with the derivation path and generate the private key in cast :
        //cast wallet private-key "test test test test test test test test test test test junk" "m/44'/60'/0'/0/12"

        //create signature
        bytes32 message = keccak256(abi.encode("BG CTF Challenge 4", main));
        bytes32 hash = message.toEthSignedMessageHash();

        (uint8 v, bytes32 r, bytes32 s) =
            vm.sign(0xa267530f49f8280200edf313ee7af6b827f2a8bce2897751d06a843f644967b1, hash);

        bytes memory signature = abi.encodePacked(r, s, v);

        // vm.prank(main);
        // Ichallenge(challengeContract).mintFlag(0xFABB0ac9d68B0B445fB7357272Ff202C5651694a, signature);

        address returned = hash.recover(signature);

        console.log(returned);
    }
}
