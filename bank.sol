// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SimpleBank {
    address public owner;
    uint256 public balance;

    constructor(){
        owner = msg.sender;
        balance = 0;
    }

    function deposit(uint256 amount) public {
        require(msg.sender == owner, "Only the owner can deposit money");
        balance += amount;
    }

    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only the owner can withdraw money");
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}
