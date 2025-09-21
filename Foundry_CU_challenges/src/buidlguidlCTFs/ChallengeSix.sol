// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface Ichallenge {
    function mintFlag(uint256 code) external;
}

contract ChallengeSix {
    address constant challenge = 0x75961D2da1DEeBaEC24cD0E180187E6D55F55840;
    uint256 constant code = 26;

    function name() external pure returns (string memory) {
        return ("BG CTF Challenge 6 Solution");
    }

    function solve() public {
        uint256 gasBurner = 0;
        while (gasleft() > 200_000) {
            gasBurner++;
        }

        Ichallenge(challenge).mintFlag(code << 8);
    }
}
