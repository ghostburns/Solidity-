// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SafeMathLib {
    function add(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }

    function sub(uint a, uint b) internal pure returns (uint) {
        require(b <= a, "Underflow error");
        return a - b;
    }
}

abstract contract VaultBase {
    using SafeMathLib for uint;

    mapping(address => uint) internal balances;

    event Deposited(address indexed user, uint amount);
    event Withdrawn(address indexed user, uint amount);

    function getBalance(address user) public view returns (uint) {
        return balances[user];
    }

    function deposit() external payable virtual;
    function withdraw(uint amount) external virtual;
}

contract VaultManager is VaultBase {
    function deposit() external payable override {
        require(msg.value > 0, "Deposit must be greater than 0");

        balances[msg.sender] = balances[msg.sender].add(msg.value);

        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint amount) external override {
        require(amount > 0, "Withdraw amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] = balances[msg.sender].sub(amount);
        payable(msg.sender).transfer(amount);

        emit Withdrawn(msg.sender, amount);
    }
}
