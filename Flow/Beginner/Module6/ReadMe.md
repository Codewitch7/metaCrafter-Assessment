# CryptoPoops Cadence Contract

This Cadence contract, named "CryptoPoops," represents a non-fungible token (NFT) contract that extends the `NonFungibleToken` contract. It introduces NFTs called "CryptoPoops" with specific properties and provides functionality for minting, managing collections, and transferring NFTs. This README provides an overview of the contract's structure and functionality.

## Description

The "CryptoPoops" contract consists of the following components:

### NFT (Non-Fungible Token)

- `NFT` is a resource representing a non-fungible token. Each NFT has the following properties:
  - `id`: A unique identifier for the NFT (UInt64).
  - `name`: The name of the NFT (String).
  - `favouriteFood`: The favorite food of the NFT (String).
  - `luckyNumber`: The lucky number of the NFT (Int).

### Collection

- `Collection` is a resource that represents a collection of NFTs. It implements the `NonFungibleToken.Provider`, `NonFungibleToken.Receiver`, and `NonFungibleToken.CollectionPublic` interfaces. This resource manages a dictionary of owned NFTs.

  - `ownedNFTs`: A dictionary that maps NFT IDs (UInt64) to their corresponding NFT instances.

  - `withdraw`: A function to withdraw (remove) an NFT from the collection and emit a "Withdraw" event. The withdrawn NFT is returned to the caller.

  - `deposit`: A function to deposit (add) an NFT to the collection and emit a "Deposit" event.

  - `getIDs`: A function to retrieve the IDs of all owned NFTs.

  - `borrowNFT`: A function to borrow an NFT by its ID and return a reference to the NFT.

  - `borrowAuthNFT`: A public function that allows borrowing an authenticated NFT by its ID, utilizing the "auth" capability.

### Minter

- `Minter` is a resource responsible for creating NFTs and minting them into collections. It includes the following functions:

  - `createNFT`: A function to create a new NFT with specified properties and return it.

  - `createMinter`: A function to create a new Minter.

### Initialization

- In the contract's `init` function, the `totalSupply` is initialized to 0, and a "ContractInitialized" event is emitted. A `Minter` resource is created and saved to the contract's storage.

- The contract extends the `NonFungibleToken` contract, which provides the base functionality for NFTs.

## Access Control

- Access control within this contract is managed through the use of resource types. Resources define ownership and access control, and they can be created, transferred, and managed in a controlled manner.

## Getting Started

### Prerequisites

- Access to the Flow blockchain development environment.

### Usage

1. Deploy the "CryptoPoops" contract on the Flow blockchain using the appropriate development tools and environment.

2. Once deployed, you can interact with the contract by calling its functions:

   - To **create a new collection**, call the `createEmptyCollection` function. This creates an empty collection of NFTs.

   - To **mint new NFTs**, interact with the `Minter` resource by calling the `createNFT` function.

   - To **manage NFTs in a collection**, use the functions in the `Collection` resource, such as withdrawing, depositing, and borrowing NFTs.

Please ensure that you have the required Flow blockchain development environment set up to deploy and interact with Cadence contracts.

## Author

Rebecca Akparanta

## License

This project is licensed under the MIT License.
