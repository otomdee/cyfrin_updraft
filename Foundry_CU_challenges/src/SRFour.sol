//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IERC721Receiver} from "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

//author: otomdee
// Note: NOT EIP 3156 compliant https://eips.ethereum.org/EIPS/eip-3156
contract FlashLoanReceiver is IERC721Receiver {
    uint256 private constant S6_NFT_COST = 2_000_000e18;
    address private constant challengeContract = 0xcf4fbA490197452Bd414E16D563623253eFb57D3;
    address private constant token = 0x155E8075c5c7Ba6FDdF29FDCE71147A3a384Ed36;
    address private constant market = 0xdA4a58F6BbfCF284ac623208000733013008cA35;

    function execute() external payable {
        //use flashloan to get NFT

        //deposit to challenge contract
        bytes memory callData = abi.encodeWithSignature("depositMoney(uint256)", S6_NFT_COST);
        (bool success,) = challengeContract.call(callData);
        success;

        //solve challenge
        string memory twitterHandle = "@0x_Money";
        bytes memory callDataSolve = abi.encodeWithSignature("solveChallenge(string)", twitterHandle);
        (bool solveSuccess,) = challengeContract.call(callDataSolve);
        solveSuccess;

        //withdraw from contract
        bytes memory withdrawCallData = abi.encodeWithSignature("withdrawMoney()");
        (bool withdrawSuccess,) = challengeContract.call(withdrawCallData);
        withdrawSuccess;

        //repay loan
        IERC20(token).transfer(market, S6_NFT_COST);
    }

    function takeLoan() external {
        bytes memory callData = abi.encodeWithSignature("flashLoan(uint256)", S6_NFT_COST);
        (bool success,) = market.call(callData);
        success;
    }

    function owner() external view returns (address) {
        return address(this);
    }

    //to approve token for challengeContract deposit
    function approveForChallenge() external {
        IERC20(token).approve(challengeContract, S6_NFT_COST);
    }

    //to recieve challenge NFT
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
    //to send out challenge NFT

    function transferNFT(address challengeNFT, address to, uint256 tokenId) external {
        IERC721(challengeNFT).safeTransferFrom(address(this), to, tokenId);
    }
}
