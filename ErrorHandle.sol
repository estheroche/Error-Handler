// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    address public owner;
    uint256 public currentValue;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
        currentValue = 0;
    }

    function updateValue(uint256 _newValue) external onlyOwner {
        // Use require for input validation
        require(_newValue > 0, "New value must be greater than zero");

        // Use assert for internal error checking
        assert(_newValue != currentValue);

        // Use revert for handling unexpected conditions
        if (_newValue < currentValue) {
            revert("New value should be greater than the current value");
        }

        currentValue = _newValue;
    }

    function withdraw() external view onlyOwner {
        // Use require to check a condition before allowing the function to proceed
        require(
            currentValue > 10,
            "Current value must be greater than 10 to withdraw"
        );

        // Perform the withdrawal logic here

        // Use revert to handle unexpected conditions
        if (currentValue % 2 == 0) {
            revert("Cannot withdraw when the current value is an even number");
        }
    }
}
