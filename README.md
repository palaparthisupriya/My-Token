## MyToken ERC-20 Implementation

This project is a custom implementation of an ERC-20 token on the Ethereum blockchain. Built using Solidity, this token follows the standard interface to allow for seamless interaction with decentralized applications (dApps) and wallets.

## What are ERC-20 Tokens?
ERC-20 is the technical standard for fungible tokens on Ethereum. "Fungible" means each token is exactly the same as every other token (like a dollar bill). This standard defines a set of rules that allow tokens to be transferred, spent, and tracked accurately across the ecosystem.

Token Details
Name: MyToken

Symbol: MTK

Decimals: 18

Total Supply: 1,000,000 MTK (Initial)

## Implemented Features
Standard ERC-20 Functions: transfer, approve, transferFrom, balanceOf, and allowance.

Event Emission: Emits Transfer and Approval events to ensure blockchain transparency and UI updates.

Ownership Control: Includes an onlyOwner modifier to restrict sensitive functions.

Minting: The contract owner has the ability to create new tokens.

Burning: Any token holder can destroy their own tokens to reduce the total supply.

Input Validation: Prevents transfers to the zero address and ensures users cannot spend more than their balance.

## Deployment Instructions (RemixIDE)
Open Remix IDE.

Create a file named MyToken.sol in the contracts/ folder and paste the source code.

Go to the Solidity Compiler tab, select version 0.8.x, and click Compile.

Go to the Deploy & Run Transactions tab.

Select Remix VM (Cancun) as the environment.

In the Deploy input field, enter your desired initial supply (e.g., 1000000000000000000000000 for 1 million tokens).

Click Deploy.

## Project Structure
├── contracts/
│   └── MyToken.sol
├── screenshots/
│   ├── compilation.png
│   ├── deployment.png
│   ├── token-info.png
│   ├── transfer-test.png
│   └── events.png
└── README.md

