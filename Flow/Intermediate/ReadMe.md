# Becky and FlowToken Swap Contract

# Becky Contract

This section provides an overview of the "Becky" contract, which is used for managing tokens within the "Swap" contract.

## Becky

"Becky" is a Fungible Token contract, similar to "FlowToken," serving as the token contract used within the "Swap" contract.

### Vault

The "Becky" contract includes a resource called "Vault," which is used for storing the balance of users' "Becky" tokens. It has functions for withdrawing and depositing tokens, as well as a function for creating an empty Vault with zero balance.

### Admin

The "Becky" contract also includes an "Admin" resource for administrative purposes.

### Minter

The "Minter" resource allows users to mint new "Becky" tokens and update the total supply.

The contract initializes by creating various contract resources and setting the total supply to 0. Public capabilities are established for admin and minter roles.

---

This contract, named "Swap," allows users to swap tokens between the "Becky" and "FlowToken" contracts. It provides functionality for swapping tokens and mints new "Becky" tokens based on the time elapsed since the last swap.

## Description

The "Swap" contract is designed to facilitate token swaps between "Becky" and "FlowToken" contracts. It includes the following features:

- **swapTokens**: A function that enables users to swap tokens between "Becky" and "FlowToken." It calculates and mints new "Becky" tokens based on the time elapsed since the last swap.

The contract maintains the `recentTimestampForSwap` variable and a mapping of `userrecentTimestampForSwaps` to track the last swap timestamp for each user. This information is used to calculate the amount of new "Becky" tokens to mint.

## Usage

1. Users can call the `swapTokens` function to exchange tokens between "Becky" and "FlowToken." This function calculates the amount of new "Becky" tokens to mint based on the time elapsed since the last swap.

2. The contract automatically calculates the time since the last swap and uses it to mint new "Becky" tokens. The newly minted tokens are added to the user's "Becky" vault.

## Initialization

The contract initializes with default values for the last swap timestamp (`recentTimestampForSwap`) and maintains a mapping of user-specific last swap timestamps (`userrecentTimestampForSwaps`).

Please note that this contract should be used in conjunction with the "Becky" and "FlowToken" contracts for complete functionality.

---

# FlowToken Contract

This section provides an overview of the "FlowToken" contract, which is used for managing tokens within the "Swap" contract.

## FlowToken

"FlowToken" is a Fungible Token contract, serving as the standard token contract for the "Swap" contract. It provides the following functionalities:

- **totalSupply**: Keeps track of the total supply of Flow tokens in existence.
- **TokensInitialized**: An event emitted when the contract is created.
- **TokensWithdrawn**: An event emitted when tokens are withdrawn from a Vault.
- **TokensDeposited**: An event emitted when tokens are deposited into a Vault.
- **TokensMinted**: An event emitted when new tokens are minted.
- **TokensBurned**: An event emitted when tokens are destroyed.

### Vault

The "FlowToken" contract includes a resource called "Vault" with various functions:

- **withdraw**: Allows users to withdraw tokens from the Vault.
- **deposit**: Enables users to deposit tokens into the Vault.
- **burnTokens**: Destroys a Vault instance, effectively burning tokens.

### Administrator

The "FlowToken" contract includes the "Administrator" resource with functions for creating and managing minters and burners.

### Minter

The "Minter" resource allows token admin accounts to mint new tokens.

### Burner

The "Burner" resource allows token admin accounts to burn tokens.

The contract initializes by setting the total supply of tokens to 0 and creating an initial Vault with zero balance, which is saved in storage. Public capabilities are created for the Vault for receiving and checking the balance.

---

# Becky Contract

This section provides an overview of the "Becky" contract, which is used for managing tokens within the "Swap" contract.

## Becky

"Becky" is a Fungible Token contract, similar to "FlowToken," serving as the token contract used within the "Swap" contract.

### Vault

The "Becky" contract includes a resource called "Vault," which is used for storing the balance of users' "Becky" tokens. It has functions for withdrawing and depositing tokens, as well as a function for creating an empty Vault with zero balance.

### Admin

The "Becky" contract also includes an "Admin" resource for administrative purposes.

### Minter

The "Minter" resource allows users to mint new "Becky" tokens and update the total supply.

The contract initializes by creating various contract resources and setting the total supply to 0. Public capabilities are established for admin and minter roles.

## Author

- Rebecca Akparanta

## License

This project is licensed under the MIT License.

---

# Import Statements

These import statements at the end of the document indicate the contracts imported from address 0x05. These contracts, including "FungibleToken," "FlowToken," and "Becky," are used within the "Swap" contract.

>Please ensure that the corresponding contracts exist at the specified addresses for complete functionality.

