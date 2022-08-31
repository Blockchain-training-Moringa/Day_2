// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

contract BankApp {
    string name;
    address public manager;
    struct Account {
        uint256 id;
        string name;
        string kraPin;
        uint256 balance;
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

    // pure does not read or modify the variables
    // view has the permission to only read the variables
    ///if you want a function to modify the variables do not add any keyword to the function

    // function login() public returns (bool) {
    //     address _user = msg.sender;
    //     Account memory account = accounts[_user];

    // // memory and storage are ways to store,...
    // // storage is a way to store data directly in the blockchain
    // // memory is a way to store data in the stack

    //     // CHECK IF USER EXISTS

    //     if (account.id == 0) {
    //         revert("Account does not exist");
    //     }
    //     if (account.status) {
    //         return true;
    //     }else{
    //         revert("Account is not active");
    //     }
    //     // change account status to true
    //     account.status = true;

    //     // make the change permanent
    //     return accounts[_user] = account;

    // }

    // That is the same with
    function login() public returns (bool) {
        address _user = msg.sender;
        Account storage account = accounts[_user];

        // memory and storage are ways to store,...
        // storage is a way to store data directly in the blockchain
        // memory is a way to store data in the stack

        // CHECK IF USER EXISTS

        if (account.id == 0) {
            revert("Account does not exist");
        }
        if (account.status) {
            return true;
        }
        // change account status to true
        // make the change permanent
        account.status = true;
    }

    function deposit(uint256 amount) public returns (bool) {
        address _user = msg.sender;
        Account storage account = accounts[_user];
        if (account.id == 0) {
            revert("Account does not exist");
        }
        if (account.status) {
            account.balance += amount;
            console.log("Account balance:", account.balance);
            return true;
        } else {
            revert("Account is not active");
        }
    }

    function logout() public view returns (bool) {
        address user = msg.sender;
        Account memory account = accounts[user];

        // CHECK IF USER EXISTS
        if (account.id == 0) {
            revert("Account does not exist");
        }
        if (!account.status) {
            return true;
        }
        // change account status to false
        return account.status = false;
    }
}
