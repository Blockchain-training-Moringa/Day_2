// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.4;

contract BankApp {
    string name;
    address public manager;
    struct Account {
        uint id;
        string name;
        string kraPin;
        uint balance;
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
}
