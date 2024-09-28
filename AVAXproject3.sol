// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 
import "@openzeppelin/contracts/access/Ownable.sol";

contract AvinToken is ERC20, Ownable {
    // Constructor to set token name, symbol, and owner
    constructor(string memory name, string memory symbol) 
        ERC20(name, symbol) 
        Ownable(msg.sender)  // Pass msg.sender automatically as the owner
    {
        // The owner is set to the deployer automatically by Ownable
    }

    // Function to mint new tokens, only callable by the owner
    function mintTokens(address recipient, uint256 amount) external onlyOwner {
        _mint(recipient, amount);
    }

    // Function to burn tokens from the caller's account
    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Override transfer function to include frozen account check
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        return super.transfer(recipient, amount);
    }
}
