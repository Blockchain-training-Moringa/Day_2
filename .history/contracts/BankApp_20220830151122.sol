// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;


contract  BankApp{
  address public manager;
  struct Account{
            uint id;
            string name;
            uint krate;
            uint balance;
  }
  constructor(){
        manager = msg.sender;
      }

  public function register(
    uint255 id, 
    string name,
    string kraPin, 
    uint256 balance
  ){


    }
  
}