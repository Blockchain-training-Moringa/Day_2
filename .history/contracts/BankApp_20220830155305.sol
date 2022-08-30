// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

contract BankApp {
    address public manager;
    struct Account {
        uint id;
        string name;
        string kraPin;
        uint balance;
    }
    mapping(address => Account) accounts;

    constructor() {
        manager = msg.sender;
    }

    function register(
        uint256 id,
        address user,
        string memory name,
        string memory kraPin,
        uint256 balance
    ) public returns (bool) {
        require(msg.sender == manager, "Sender not manager");
        Account memory account = accounts[user];

        if (account.id != 0) {
            revert("Account already exists");
        }

        account.id = id;
        account.name = name;
        account.kraPin = kraPin;
        account.balance = balance;
        accounts[user] = account;
        return true;
    }
}
