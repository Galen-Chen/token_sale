pragma solidity ^0.4.2;
import "./Dapptoken.sol";

contract DappTokenSale {
    address admin;  
    DappToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

    constructor(DappToken _tokenContract, uint256 _tokenPrice) public {
        // assign an admin
        admin = msg.sender;
        tokenContract = _tokenContract;
        // token contract
        // token price
        tokenPrice = _tokenPrice;

    }
    function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    }

    // buy tokens
    function buyTokens(uint256 _numberOfTokens) public payable {
        //require that value is equal to tokens
        //require that the contract has enough tokens
        // require that a transfer is successful

        require(msg.value == multiply(_numberOfTokens, tokenPrice));
        require(tokenContract.balanceOf(this) >= _numberOfTokens);
        require(tokenContract.transfer(msg.sender, _numberOfTokens));
        //keep track of tokensSold

        // emit sell event
        tokensSold += _numberOfTokens;

        emit Sell(msg.sender,_numberOfTokens);


    }

    function endSale() public {
        // require admin
        require(msg.sender == admin);
        require(tokenContract.transfer(admin,tokenContract.balanceOf(this)));
        // transfer remaining dapp tokens to admin

        admin.transfer(address(this).balance);
    }


}