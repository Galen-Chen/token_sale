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

    //transfer
    event Approval(
        address indexed _owner, 
        address indexed _spender, 
        uint256 _value
    );


  
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256))public allowance;

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
    // delegated transfer


    //approve
    function approve(address _spender, uint256 _value) public returns(bool success) {
        //allowance
        allowance[msg.sender][_spender] = _value;
        //trigger 
        emit Approval(msg.sender,_spender,_value);


        return true;
    }

    //transfer from

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        //require from account has enough tokens
        require(_value <= balanceOf[_from]);
        //require allowance is big enough
        require(_value <= allowance[_from][msg.sender]);
        // transfer event
        //change the balance

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        //update the allowance
        allowance[_from][msg.sender] -= _value;

        emit Transfer (_from,_to,_value);


        return true;
    }




}