//SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.0;

contract Token {
   string public name = "My Token";
   string public symbol;
   uint public decimals = 18;
   uint public totalSupply;

   // Track account balances
   mapping (address => uint) public balance0f;

   constructor(
      string memory _name, 
      string memory _symbol, 
      uint _totalSupply
   )
   
   {
      name = _name;
      symbol = _symbol;
      totalSupply = _totalSupply * (10 ** decimals);
      balance0f[msg.sender] = totalSupply;
   }
}

