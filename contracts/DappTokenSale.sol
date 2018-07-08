pragma solidity ^0.4.2;
import "./Dapptoken.sol";

contract DappTokenSale {
    address admin;  
    DappToken public tokenContract;
    uint256 public tokenPrice;

    constructor(DappToken _tokenContract, uint256 _tokenPrice) public {
        // assign an admin
        admin = msg.sender;
        tokenContract = _tokenContract;
        // token contract
        // token price
        tokenPrice = _tokenPrice;


    }
}