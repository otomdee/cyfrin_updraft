// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract AdvancedNine {
    uint256 public s_variable;
    uint256 public s_otherVar;

    function getOwner() external returns (address) {
        return 0x645b4605dC74e8eFF38d3FD26C3cabA853ABbF61;
    }

    function doSomething() external {
        s_variable = 123;
        s_otherVar = 1;
    }

    function setOtherVar() external {}
}
