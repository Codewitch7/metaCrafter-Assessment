# StellarUniversity Cadence Contract

This Cadence contract, named "StellarUniversity," defines a simple smart contract for managing courses and enrollments within a university. Cadence is a programming language designed for the Flow blockchain. This README provides an overview of the contract's structure and functionality.

## Description

The "StellarUniversity" contract consists of the following components:

### Course Struct

- `Course` is a struct that represents a course. It has two properties:
  - `courseId`: A unique identifier for the course (UInt64).
  - `courseName`: The name of the course (String).

### Initialization

- In the contract's `init` function, the `courses` dictionary is initialized as an empty dictionary. This dictionary will be used to store course information.

### Adding a Course

- The `addCourse` function allows the addition of a new course to the `courses` dictionary. It takes two parameters:
  - `courseId`: The unique identifier for the new course.
  - `courseName`: The name of the new course.
  
- Inside the `addCourse` function, a new `Course` instance is created with the provided `courseId` and `courseName`, and then it is added to the `courses` dictionary.

### Getting a Course

- The `getCourse` function is used to retrieve course information by its `courseId`. It takes one parameter:
  - `courseId`: The unique identifier of the course to retrieve.

- If a course with the specified `courseId` exists in the `courses` dictionary, it is returned as a `Course` struct. If not, `nil` is returned.

## Getting Started

### Prerequisites

- Access to the Flow blockchain development environment.

### Usage

1. Deploy the "StellarUniversity" contract on the Flow blockchain using the appropriate development tools and environment.

2. Once deployed, you can interact with the contract by calling its functions:

   - To **add a new course**, call the `addCourse` function with the `courseId` and `courseName` as parameters. This will add the course to the `courses` dictionary.

   - To **get information about a course**, call the `getCourse` function with the `courseId` as a parameter. If the course exists, its details will be returned as a `Course` struct.


## Author

Rebecca Akparanta

## License

This project is licensed under the MIT License.
