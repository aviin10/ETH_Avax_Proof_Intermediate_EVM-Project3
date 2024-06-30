// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyToken {

    // Public variables
    string public name = "ERC20";
    uint public totalSupply = 0;

    // Mapping to store balances
    mapping (address => uint) public balances;

    // Events
    event Transfer(address indexed from, address indexed to, uint value);

    // Mint function
    function mint(address _to, uint _value) public {
        totalSupply += _value;
        balances[_to] += _value;
        emit Transfer(address(0), _to, _value);
    }

    // Burn function
    function burn(address _from, uint _value) public {
        require(balances[_from] >= _value, "Balance too low to burn");
        totalSupply -= _value;
        balances[_from] -= _value;
        emit Transfer(_from, address(0), _value);
    }

    // Transfer function
    function transfer(address _to, uint _value) public returns (bool success) {
        require(balances[msg.sender] >= _value, "Balance too low for transfer");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }



    // TransferFrom function
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        require(balances[_from] >= _value, "Balance too low for transfer");
        balances[_from] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}
