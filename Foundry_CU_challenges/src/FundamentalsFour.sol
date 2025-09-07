// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

//calling solve() on this contract solves the challenge and mints the NFT
//to the contract address(enabled via onERC721Received() from IERC721Receiver)

/**
 * @title Cyfrin Updraft Foundry Fundamentals Section 4 Challenge Solution
 * @author otomdee
 */
contract FundamentalsFour is IERC721Receiver {
    error FundamentalsFour__SolveFailed();

    function solve(address challengeAddress) external {
        uint256 correctAnswer =
            uint256(keccak256(abi.encodePacked(address(this), block.prevrandao, block.timestamp))) % 100000;

        string memory twitterHandle = "@0x_Money";
        bytes memory callData = abi.encodeWithSignature("solveChallenge(uint256,string)", correctAnswer, twitterHandle);

        (bool success,) = challengeAddress.call(callData);

        if (!success) {
            revert FundamentalsFour__SolveFailed();
        }
    }

    function myAttribute(address challengeAddress) external returns (string memory) {
        bytes memory callData = abi.encodeWithSignature("attribute()");
        (bool success, bytes memory returnData) = challengeAddress.call(callData);
        success;
        return (abi.decode(returnData, (string)));
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
