// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    address public  owner;
    string public name;
    string public symbol;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    constructor() {
        owner = msg.sender;
        name = "Becky";
        symbol = "BEE";
        totalSupply = 1000 * (10**uint256(18));

    }

      function mint( uint256 _value) public returns (bool success) {
        require(msg.sender == owner, "Only Madam Becky can mint BEE tokens");

        balanceOf[msg.sender] += _value;
        totalSupply += _value;
        emit Transfer(address(0), msg.sender, _value);
        return true;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Not enough funds");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function burn(uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Not enough funds");

        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }

  
}
