// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

contract BankApp {
    string name;
    address public manager;
    struct Account {
        uint id;
        string name;
        string kraPin;
        uint balance;
        bool status;
    }
    mapping(address => Account) accounts;

    constructor(string memory _name) {
        manager = msg.sender;
        name = _name;
    }

    function register(
        uint256 id,
        address user,
        string memory _name,
        string memory kraPin,
        uint256 balance
    ) public returns (bool) {
        require(msg.sender == manager, "Sender not manager");
        Account memory account = accounts[user];

        if (account.id != 0) {
            revert("Account already exists");
        }

        account.id = id;
        account.name = _name;
        account.kraPin = kraPin;
        account.balance = balance;
        accounts[user] = account;
        return true;
    }

    function login(uint256 id) view public returns(bool) {
        Account memory account = accounts[msg.sender];
        require(account.id == id, "Invalid id");
        return true;

    }
}
