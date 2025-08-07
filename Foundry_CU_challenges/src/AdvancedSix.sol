// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract AdvancedSix {
    //large number is "owner" address in challenge contract, set in constructor by Ownable
    int256 private s_number = (1337 - 572038313094850821099624258919152072749626292375);

    address s_owner = 0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61;

    function owner() external view returns (address) {
        return s_owner;
    }

    //needs to return a number to make number + 2 + 10 = TARGET_NUMBER
    function getNumber() external view returns (int256) {
        return s_number;
    }
}
