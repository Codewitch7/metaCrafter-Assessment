// SPDX-License-Identifier: MIT

// Specifies the license for the smart contract.
pragma solidity 0.8.18;

// A smart contract representing a simple token named MyToken.
contract MyToken {

    // Public variables to store token details.
    string public name = "Becky";   // The name of the token.
    string public symbol = "BEE";   // The symbol or ticker of the token.
    uint public totalSupply = 0;    // The total supply of the token.

    // Mapping to store token balances of addresses.
    mapping (address => uint) public balances;

    // Function to mint new tokens and assign to an address.
    function mint(address _to, uint _value) public {
        // Increase the balance of the recipient address by the given value.
        balances[_to] += _value;
        // Increase the total supply by the given value.
        totalSupply += _value;
    }

    // Function to burn (destroy) tokens from an address.
    function burn(address _from, uint _value) public {
        // Check if the balance of the address is greater than or equal to the value to be burned.
        if (balances[_from] >= _value) {
            // Decrease the total supply by the burned value.
            totalSupply -= _value;
            // Decrease the balance of the address by the burned value.
            balances[_from] -= _value;
        }
    }
}
