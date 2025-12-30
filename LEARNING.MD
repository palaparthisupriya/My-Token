## Learning Journey: Building My First ERC-20 Token1. 
1. Objectives & Outcomes
The primary goal of this project was to understand the ERC-20 standard, which is the blueprint for thousands of tokens on the Ethereum network.
Key Skills Gained: I learned how to use Remix IDE to write, compile, and deploy smart contracts.
Solidity Fundamentals: I practiced using mappings to track account balances and require statements to validate transactions (e.g., checking if a user has enough tokens).
Event Logging: I learned how to emit Transfer and Approval events so that off-chain applications (like block explorers or wallets) can track what happens inside the contract.
2. Deep Dive: Key ConceptsThe Role of DecimalsIn Solidity, there are no "decimal" or "floating-point" numbers; everything is an integer. 
To allow for fractional tokens, we use a decimals value (usually 18).
Technicality: If I want to send 1 token, I actually send $1 \times 10^{18}$ base units. 
This was a major "aha!" moment during the testing phase.Transfer vs. TransferFromUnderstanding the difference between these two was critical for implementing a working token:transfer: Used when I send tokens directly to another person.transferFrom: Used when I "approve" a third party (like a decentralized exchange) to move tokens for me. T
his is the foundation of DeFi interaction.
3. Challenges & Troubleshooting
Building a blockchain project for the first time came with several hurdles:

Zero Address Validation: I initially forgot to prevent transfers to the 0x0 address. I learned that because tokens sent there are lost forever, it is a best practice to add require(to != address(0)).

Allowance Logic: Testing the approve and transferFrom flow was confusing at first. I had to learn how to switch between different accounts in Remix to simulate an "Owner" and a "Spender".

Integer Overflows: While older versions of Solidity required libraries like SafeMath, I learned that Solidity 0.8.x has built-in checks that automatically prevent numbers from rolling over.

4. Reflections
This project taught me that smart contracts are immutable—once they are on the blockchain, you cannot simply "fix a bug" and re-upload it to the same spot. This highlights the absolute necessity of thorough testing in a local environment (like Remix VM) before going live.

I now feel confident navigating the Ethereum developer ecosystem and look forward to building more complex dApps in the future.
