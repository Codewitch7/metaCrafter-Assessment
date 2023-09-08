# ErrorHandling Solidity Contract

This Solidity contract, named "ErrorHandling," illustrates various error-handling mechanisms within Solidity, including the `require()`, `assert()`, and `revert()` statements. It demonstrates how to validate conditions and handle errors in a smart contract.

## Description

The "ErrorHandling" contract is a Solidity contract designed to showcase error handling techniques. It includes a public variable `num`, which can be updated by calling the `updateNum` function. This function performs three types of error checks:

1. *require() Statement*: It checks whether the input `_newNum` is greater than zero. If this condition is not met, it reverts the transaction with an error message.

2. *assert() Statement*: It verifies that `_newNum` is not equal to the current # ErrorHandling Solidity Contract

This Solidity contract, named "ErrorHandling," illustrates various error-handling mechanisms within Solidity, including the `require()`, `assert()`, and `revert()` statements. It demonstrates how to validate conditions and handle errors in a smart contract.

## Description

The "ErrorHandling" contract is a Solidity contract designed to showcase error handling techniques. It includes a public variable `num`, which can be updated by calling the `updateNum` function. This function performs three types of error checks:

1. *require() Statement*: It checks whether the input `_newNum` is greater than zero. If this condition is not met, it reverts the transaction with an error message.

2. *assert() Statement*: It verifies that `_newNum` is not equal to the current value of `num`. If this condition is not met, it throws an exception.

3. *revert() Statement*: It unconditionally reverts the transaction with a custom error message, regardless of the conditions.

These error-handling mechanisms demonstrate how to ensure that certain conditions are met before allowing state changes in the contract. This contract is a simplified example for educational purposes and might require more comprehensive error handling in production code.

## Getting Started

### Prerequisites

- Access to an Ethereum wallet and Remix Solidity IDE (https://remix.ethereum.org/).

### Usage

1. Open Remix in your web browser.

2. Create a new file named `ErrorHandling.sol`.

3. Copy and paste the provided Solidity code into the file.

4. Compile the contract by clicking on the "Solidity Compiler" tab, ensuring the compiler version is set to `0.8.0`, and then clicking on the "Compile ErrorHandling.sol" button.

5. Deploy the contract by clicking on the "Deploy & Run Transactions" tab. Select the `ErrorHandling` contract from the dropdown menu, and then click on the "Deploy" button.

6. Once the contract is deployed, you can interact with it:
   - To update the `num` variable, click on the `updateNum` function under the deployed contract, provide a new value for `_newNum`, and click "transact." Observe how the error handling mechanisms respond to different input values.

Please note that in a production environment, more robust and context-specific error handling would be necessary for secure and reliable smart contracts.

## Authors

Rebecca Akparanta

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
