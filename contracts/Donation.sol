// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Donation {
  address payable public owner;
  address[] public donators;

  constructor() public {
    owner = payable(msg.sender);
  }
  //Функция перевода пожертований
  function gatDonation() public payable{
    require(msg.value >= .0001 ether);
    donators.push(msg.sender);
  }

  //Вывод на счет владельца
  function transferToOwner() external{
    require(msg.sender == owner);
    owner.transfer(address(this).balance);
  }
//Возращает кто задонатил
  function getDonators() public view returns(address[] memory){
    return donators;
  }
  //Баланс нашего контракта
  function balanceCont() public returns(uint256){
    return address(this).balance;
  }
}
