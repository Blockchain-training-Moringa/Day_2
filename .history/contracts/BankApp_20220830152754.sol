// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.4;

contract BankApp {
    address public manager;
    struct Account {
        uint id;
        string name;
        uint krate;
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
    ) public       view
{
        require(msg.sender == manager, "Sender not manager");
        Account memory account = accounts[user];

        if(account.id != 0){
          revert("Account already exists");
        }
    }
}
