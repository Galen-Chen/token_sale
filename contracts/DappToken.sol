pragma solidity ^0.4.2;

contract DappToken{
    //constructor
    //set the total number of tokens
    // read the total number of tokens
    string public name = "DApp Token";
    string public symbol = "DAPP";
    string public standard = "DApp Token v1.0";
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;

    constructor(uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
        //allocate the initial supply
    }
    //Transfer

    function transfer(address _to, uint256 _value) public returns (bool success) {
        //exception if account
        require(balanceOf[msg.sender] >= _value);
        //transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        //transfer event
        emit Transfer(msg.sender,_to,_value);

        //return a bool value

        return true;
    }



}