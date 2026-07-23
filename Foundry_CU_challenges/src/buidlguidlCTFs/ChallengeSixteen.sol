// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Ichallenge {
    function mintFlag() external;
}

contract ChallengeSixteen {
    address constant CHALLENGE = 0x49918e16349416Ae13827758Bc8F8267e25D7B1c;

    function solve() external {
        Ichallenge(CHALLENGE).mintFlag();
    }

    receive() external payable {}

    fallback() external payable {
        (bool ok,) = address(CHALLENGE).call{value: 1 wei}("");
        ok;
    }
}
