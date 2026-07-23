// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {ChallengeFourteen} from "src/buidlguidlCTFs/ChallengeFourteen.sol";

contract ChallengeFourteenScript is Script {
    function run() public {
        vm.startBroadcast();
        ChallengeFourteen solver = new ChallengeFourteen();
        solver.solve();
        vm.stopBroadcast();
    }
}
