// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Script, console} from "forge-std/Script.sol";
import {Transfer} from "../src/Transfer.sol";
import {IERC20} from "forge-std/interfaces/IERC20.sol";

interface ITransfer {
    function transferAsset() external;
}

contract CallTransferScript is Script {
    address public constant USDC = 0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238;
    address public constant TRANSFER_ADDR =
        0x3cA600DEEE77892c738843F02FaF627Ab162f5a8;

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        IERC20(USDC).transfer(TRANSFER_ADDR, 1500000);

        console.log("transferring");
        ITransfer(TRANSFER_ADDR).transferAsset();
        console.log("complete");
        vm.stopBroadcast();
    }
}

// forge script script/CallTransfer.s.sol:CallTransferScript --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast