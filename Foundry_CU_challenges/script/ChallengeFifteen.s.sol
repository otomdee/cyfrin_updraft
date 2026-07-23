// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {ChallengeFifteen} from "src/buidlguidlCTFs/ChallengeFifteen.sol";

contract ChallengeFifteenScript is Script {
    function run() public {
        vm.startBroadcast();
        ChallengeFifteen solver = new ChallengeFifteen();
        solver.solve();
        vm.stopBroadcast();
    }
}
