//SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.0;

contract Token {
   string public name = "My Token";
   string public symbol;
   uint public decimals = 18;
   uint public totalSupply;

   // Track account balances
   mapping (address => uint) public balance0f;
   mapping (address => mapping(address => uint)) public allowance;

   event Transfer(
      	address indexed _from,
         address indexed _to,
         uint _value
   );

   event Approval(
      address indexed _owner,
      address indexed _spender,
      uint _value
   );

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
   //Erklärung: "function" ist der Aufruf der Funktion, "transfer" ist der Name der FUnktion "(Parameter)" address ist die Bezeichnung des
   //Parameters und dahinter der Datentyp des Parameters "public" sagt aus, dass jeder die funktion aufrufen kann "bool" ist ein Datentyp
   //der fest definiert ist, was die funktion zurückgeben soll, bool bedeutet, dass ein true oder false zurückgegeben werden kann 
   function transfer(address _to, uint _value) public returns (bool success) {

      require(
         _to != address(0),
         "Transferring to zero address is not permitted"
      );

      require(
         balance0f[msg.sender] >= _value,
         "Insufficient funds"
      );

      balance0f[msg.sender] = balance0f[msg.sender] - _value;
      balance0f[_to] = balance0f[_to] + _value;

      emit Transfer(msg.sender, _to, _value);
   }

   function approve(address _spender, uint _value) public returns (bool success) {

      require(
         _spender != address(0),
         "Approval of zero address is not premitted"
      );

      allowance[msg.sender][_spender] = _value;

      emit Approval(msg.sender, _spender, _value);
      return true;
   }

}

