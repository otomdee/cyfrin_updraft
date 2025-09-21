// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ChallengeEleven} from "./ChallengeEleven.sol";

contract Factory {
    function deploy(bytes32 salt) external returns (address) {
        bytes memory bytecode = type(ChallengeEleven).creationCode;
        address addr;

        assembly {
            addr := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
            if iszero(extcodesize(addr)) { revert(0, 0) }
        }

        return addr;
    }
}
