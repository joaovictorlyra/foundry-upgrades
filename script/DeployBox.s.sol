// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {BoxV1} from "../src/boxV1.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DepployBox is Script {
    function run() external returns (address) {
        address proxy = deployProxy(); 
        return proxy;
    }

    function deployProxy() public returns (address) {
        vm.startBroadcast();
        BoxV1 box = new BoxV1(); // implementation (logic)
        ERC1967Proxy proxy = new ERC1967Proxy(
            address(box),
            ""
        );
        vm.stopBroadcast();
        return address(proxy);
    }
}