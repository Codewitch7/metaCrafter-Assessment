// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ErrorHandling {

    uint public num;

    // The following function updates the contract's Num
    function updateNum(uint _newNum) public {
        // The require() statement checks a condition and reverts if it evaluates to false
        require(_newNum > 0, "Num must be greater than zero");

        // The assert() statement checks a condition and throws an exception if it evaluates to false
        assert(_newNum != num);

        // The contract's Num is updated if the conditions are met
        num = _newNum;

        // The revert() statement throws an exception, reverting the changes if executed
        revert("Failed to update Num");
    }
}
