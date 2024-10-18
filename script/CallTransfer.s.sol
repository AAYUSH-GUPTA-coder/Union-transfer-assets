// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Script, console} from "forge-std/Script.sol";
import {Transfer} from "../src/Transfer.sol";
import {IERC20} from "forge-std/interfaces/IERC20.sol";

interface ITransfer {
    function transferAsset(bytes calldata _receiver) external;
}

contract CallTransferScript is Script {
    address public constant USDC = 0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238;
    // address public constant TRANSFER_ADDR =
    //     0x3cA600DEEE77892c738843F02FaF627Ab162f5a8;
    address public constant TRANSFER_ADDR =
        0x8eb0fD3B3fb1bF44CF7C01785c74a7A8dCD6E60C;
    bytes public constant RECEIVER =
        hex"c747c491a442191646a349570bbf33b36a0cc1a9";

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        IERC20(USDC).transfer(TRANSFER_ADDR, 1500000);

        console.log("transferring");
        ITransfer(TRANSFER_ADDR).transferAsset(RECEIVER);
        console.log("complete");
        vm.stopBroadcast();
    }
}

// forge script script/CallTransfer.s.sol:CallTransferScript --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
