// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {ChallengeEleven} from "src/buidlguidlCTFs/ChallengeEleven.sol";
import {Factory} from "src/buidlguidlCTFs/Factory.sol";

//CREATE2 cannot be called by an EOA, so deploy a factory which will call CREATE2 with a given salt,
//then loop to find a salt with the factory on mainnet. When the salt is found, call deploy(salt) on factory,
//then solve the challenge by calling solve() on that contract.

contract CTFElevenTest is Test {
    address factory = 0x4dC23E7b6Cc69d38040b236bE92eAF40Dc97DCdb;
    address main = 0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61; //my EOA

    function testCTFEleven() public {
        Factory first = Factory(factory);

        //call deploy with different salt until a match is found
        uint256 numSalt = 0;
        bytes32 salt = keccak256(abi.encodePacked(numSalt));

        address addr = address(0);

        uint8 senderLast = uint8(abi.encodePacked(addr)[19]);
        uint8 originLast = uint8(abi.encodePacked(main)[19]);

        vm.startPrank(main);
        while ((senderLast & 0x15) != (originLast & 0x15)) {
            numSalt++;
            salt = keccak256(abi.encodePacked(numSalt));
            addr = first.deploy(salt);
            senderLast = uint8(abi.encodePacked(addr)[19]);
        }
        vm.stopPrank();

        console.log("address final: ", addr);
        console.logBytes32(salt);
    }
}
