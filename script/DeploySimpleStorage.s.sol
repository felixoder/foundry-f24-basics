// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        // vm is for the forge-std lib only used for foundry
        vm.startBroadcast();
        // any transaction we want to send should always put inside this sections
        SimpleStorage simpleStorage = new SimpleStorage();
        // The new keyword creates a new contract of SimpleStorage in solidity
        vm.stopBroadcast();
        return simpleStorage;
    }
}
