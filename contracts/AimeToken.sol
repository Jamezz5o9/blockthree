
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract AimeToken is ERC20{
   
    uint public totalTokenValueInMDT;
    event Received(address sender, uint amount);
    event Sent(address recipient, uint amount, address sender);

    constructor()ERC20("AimeToken","MDT"){
        
        _mint(msg.sender, 1000000 *(10 ** 18));

        totalTokenValueInMDT= (totalSupply()/(10 ** 18));
        //total token value is 1000000MDT

    }

    function buyToken (address recipient) public payable returns(uint){
        uint amount;
        amount= msg.value;
        emit Received(msg.sender, amount);

        uint tokenAmount = (amount /(10**18) ) * 1000; //token equivalent of amount
       //1000 tokens equals 1eth

        _mint(recipient, tokenAmount *(10 ** 18));
        emit Sent(recipient, tokenAmount *(10 ** 18), msg.sender);
        //increases total token supply by minting token equivalent to recipient

       totalTokenValueInMDT = (totalSupply()/(10 ** 18));
        //the new total token value 

        return totalTokenValueInMDT;
       
    } 

    //fxn to get the amount token in MDT that an account has

    function getBalanceInMDT(address accountAddress ) public view returns(uint){
        uint balance = (balanceOf(accountAddress)/(10 ** 18));
            return balance;
    }



}
