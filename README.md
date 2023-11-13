# Error-Handler in Smart Contract

##  Table of Content

- [Contract details](#contract-details)

An error handler is a mechanism in software development that deals with errors or exceptions that may occur during the execution of a program. Errors can happen for various reasons, such as incorrect user input, hardware failures, or unexpected conditions in the program.

The primary purpose of an error handler is to gracefully manage these errors, preventing them from causing the entire program to crash or behave unpredictably. Instead, the error handler allows the program to respond to errors in a controlled manner, often by providing meaningful error messages, logging relevant information for debugging, and potentially taking corrective actions.

## Contract Structure:

### State Variables:
        
`address public owner;:` An Ethereum address representing the owner of the contract.

`uint256 public currentValue;`: An unsigned integer variable to store the current value.

`Modifiers`:
        
`modifier onlyOwner() {...}`:

 A custom modifier that restricts certain functions to be callable only by the contract owner. It uses the require statement to check if the caller is the owner before allowing the function to execute.

- Constructor:

`constructor() {...}`: The constructor function sets the initial values when the contract is deployed. It initializes the owner with the address that deploys the contract and sets currentValue to 0.

- Functions:

 `function updateValue(uint256 _newValue) external onlyOwner {...}`: 
 
 A function that allows the owner to update the currentValue. It includes input validation using require, internal error checking using assert, and handling unexpected conditions using revert.

`function withdraw() external view onlyOwner {...}`: 

A function for the owner to withdraw funds, with a condition check using require. It also includes a condition using revert to handle unexpected situations.

### Conclusion:

The contract showcases best practices such as input validation, access control with modifiers, and the use of different error-handling mechanisms (`require, assert,` and `revert`).


## Authors
[@metacraftersio]()

[Oche Esther](https://twitter.com/Estheroche1)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.