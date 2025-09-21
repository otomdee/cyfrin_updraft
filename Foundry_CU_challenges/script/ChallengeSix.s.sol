// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {ChallengeSix} from "src/buidlguidlCTFs/ChallengeSix.sol";

contract ChallengeSixScript is Script {
    function run() public {
        //will fail because foundry has no way to set tx gas limit manually (yet)
        //send the tx manually (on etherscan etc) and set the gas limit in the wallet
        //around 500_000 should work

        vm.startBroadcast();
        ChallengeSix solver = new ChallengeSix();
        solver.solve();
        vm.stopBroadcast();
    }
}
