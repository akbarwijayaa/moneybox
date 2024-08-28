// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Moneybox {
    uint256 public balance;
    address private owner;

    receive() external payable {
        balance = balance + msg.value;
    }

    constructor(){
        owner = msg.sender;
    }

    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "only owner can withdraw");
        require(amount <= balance, "not enough money");

        destAddr.transfer(amount);
        balance -= amount;
    }
}

