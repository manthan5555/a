// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Bank {
    int bal;

    constructor() {
        bal = 0;
    }

    function getBalance() public view returns (int) {
        return bal;
    }

    function withdraw(int amt) public {
        if (bal < amt) {
            bal;
        } else {
            bal = bal - amt;
        }
    }

    function Deposit(int amt) public {
        bal = bal + amt;
    }
}
