// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Script, console} from "forge-std/Script.sol";
import {Transfer} from "../src/Transfer.sol";
import {IERC20} from "forge-std/interfaces/IERC20.sol";

contract TransferScript is Script {
  address public constant USDC = 0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238;

  function run() public {
    uint256 privateKey = vm.envUint("PRIVATE_KEY");
    // Set balance of the specified address to 1000 ETH
    // address targetAddress = 0x8680c6Ad2c2D13EeD71F22b856b2EE158A299C09;
    // vm.deal(targetAddress, 9000 ether);

    vm.startBroadcast(privateKey);
    Transfer transfer = new Transfer();

    IERC20(USDC).transfer(address(transfer), 1500000);

    console.log("transferring");
    transfer.transferAsset();
    console.log("complete");
    vm.stopBroadcast();
  }
}