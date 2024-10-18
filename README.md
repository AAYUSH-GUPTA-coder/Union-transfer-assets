# USDC Cross-Chain Transfer: Ethereum Sepolia to Union Chain
This repository contains the smart contract code and scripts for sending USDC from the Ethereum Sepolia testnet to the Union Chain using Union Protocol. It demonstrates a cross-chain transfer using the capabilities of the Union Protocol.

## Prerequisites
- Foundry 
- Git
- Any Ethereum wallet

## Getting Started
### 1. Clone the Repository
Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/Union-transfer-assets.git
cd Union-transfer-assets
```

### 2. Install Foundry
If you haven't installed Foundry yet, you can do so by running:

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```
This will install Foundry and Foundry’s tools (forge, cast, anvil).

### 3. Setup the Environment Variables
Create a `.env` file in the root directory of the project. You'll need to specify the following environment variables:

```plaintext
RPC_URL=https:https://sepolia.....
PRIVATE_KEY=your_private_key_here
```

PRIVATE_KEY: Your Ethereum account's private key. Do not share this or commit it to version control.

RPC_URL: The RPC endpoint for the Sepolia testnet, provided by QucikNode, Infura or Alchemy.

### 4. Install Dependencies
Install the required dependencies:

```bash
forge install
```

### 5. Compile the Contracts
Compile the smart contracts using Foundry:

```bash
forge build
```

### 6. Deploy the Contracts
To deploy the smart contracts to the Sepolia network, use:

```bash
forge script script/Transfer.s.sol:TransferScript --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
```

### 7. Execute the Transfer
To send USDC from Sepolia to the Union Chain, you can use a script:

```bash
forge script script/CallTransfer.s.sol:CallTransferScript --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
```

## Smart Contract Details
- The contracts facilitate cross-chain USDC transfers using Union Protocol.
- The USDC is transferred from the Sepolia network to the Union Chain.
- The project leverages the Foundry framework for development and deployment.

## Notes
- Ensure you have some Sepolia ETH for gas fees and USDC for transfer.
- Double-check that your .env file is correctly set up with all required parameters.
- If using a different RPC provider, adjust the URLs accordingly.

## License
This project is licensed under the MIT License.
