# SomeContract Cadence Contract

This Cadence contract, named "SomeContract," provides an example of access control and organization within a smart contract. Cadence is a programming language designed for the Flow blockchain. This README outlines the contract's structure and access control rules.

## Description

The "SomeContract" contract consists of the following components:

### SomeStruct

- `SomeStruct` is a struct that encapsulates various variables and functions. It demonstrates different access control levels:

  - `a`: A variable that can be read and modified by any area (1, 2, 3, and 4). It is marked with `pub(set)`, which allows it to be modified within the contract but read from anywhere.

  - `b`: A variable that can be read by any area but can only be modified in Area 1. It is marked as `pub`, indicating public read access and restricted write access.

  - `c`: A variable that can be read by any area (1, 2, and 3) but can only be modified within the contract (Area 1). It is marked with `access(contract)`.

  - `d`: A variable that can be read and modified within Area 1 only. It is marked with `access(self)`.

  - `publicFunc`: A public function that can be called from any area (1, 2, 3, and 4).

  - `contractFunc`: A function that can be called from any area (1, 2, and 3) but has access within the contract only.

  - `privateFunc`: A function that can only be called from Area 1 and has access within the struct only.

  - `structFunc`: A public function within the struct, but its access control is not explicitly defined. By default, it can be called from any area (1, 2, 3, and 4).

### SomeResource

- `SomeResource` is a resource type that includes a variable `e` and a function `resourceFunc`. Resource types are used to represent ownership in Flow.

  - `e`: A variable that can be read and modified from any area (1, 2, 3, and 4).

  - `resourceFunc`: A function that can be called from any area (1, 2, 3, and 4).

### Functions

- `createSomeResource`: A public function that creates an instance of `SomeResource` and returns it as an owned resource.

- `questsAreFun`: A public function that can be called from any area (1, 2, 3, and 4).

### Initialization

- In the contract's `init` function, an instance of `SomeStruct` is created and assigned to the `testStruct` variable.

## Access Control

Access control in this contract is defined based on areas:

- **Area 1**: The most permissive area with full access to all variables and functions within the contract.

- **Area 2**: A less permissive area with access to public functions and variables, including those within resource types.

- **Area 3**: A more restricted area with access to fewer functions and variables.

- **Area 4**: An area with the least access control.

## Getting Started

### Prerequisites

- Access to the Flow blockchain development environment.

### Usage

1. Deploy the "SomeContract" contract on the Flow blockchain using the appropriate development tools and environment.

2. Once deployed, you can interact with the contract by calling its functions and accessing its variables based on the defined access control rules for each area.

Please ensure that you have the required Flow blockchain development environment set up to deploy and interact with Cadence contracts.

## Author

Rebecca Akparanta

## License

This project is licensed under the MIT License.
