# Token Solidity Contract
This Solidity contract, named "Token," represents a basic token smart contract for managing a token named "Becky" with the symbol "BEE." It includes functionalities for minting, transferring, and burning tokens. This README provides an overview of the contract and instructions on how to deploy and interact with it using Remix, an online Solidity IDE.

## Description
The "Token" contract is a simple example of an Ethereum token contract. It contains the following key features:

owner: The address of the contract owner, set during contract deployment.
name: The name of the token, set to "Becky."
symbol: The symbol of the token, set to "BEE."
totalSupply: The total supply of tokens, initially set to 1,000 tokens with 18 decimal places.
balanceOf: A mapping that stores the token balance for each address.
Transfer event: Emitted when tokens are transferred from one address to another.
Burn event: Emitted when tokens are burned (destroyed).

The contract includes three main functions:

mint: Allows the contract owner (Madam Becky) to mint new tokens and add them to their own balance. Only the owner can call this function.

transfer: Allows token holders to transfer tokens to other addresses.

burn: Allows token holders to burn (destroy) their own tokens, reducing the total supply.

These functions include error checks to ensure that transfers and burns can only be executed if the sender has a sufficient token balance.

## Getting Started
Prerequisites
Access to an Ethereum wallet and Remix Solidity IDE (https://remix.ethereum.org/).
## Usage
Open Remix in your web browser.

Create a new file named Token.sol.

Copy and paste the provided Solidity code into the file.

Compile the contract by clicking on the "Solidity Compiler" tab, ensuring the compiler version is set to 0.8.0, and then clicking on the "Compile Token.sol" button.

Deploy the contract by clicking on the "Deploy & Run Transactions" tab. Select the Token contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it:

To mint new tokens, click on the mint function under the deployed contract, provide the desired _value, and click "transact." Note that only the contract owner (Madam Becky) can mint tokens.

To transfer tokens, click on the transfer function, provide the recipient address (_to) and the amount (_value), and click "transact." Ensure you have a sufficient token balance to execute the transfer.

To burn tokens, click on the burn function, provide the amount (_value), and click "transact." This function allows token holders to reduce the total token supply by destroying their own tokens.

Please exercise caution when interacting with smart contracts and ensure that you have the appropriate permissions for minting tokens.

## Authors
Rebecca Akparanta

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
