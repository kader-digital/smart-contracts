pragma solidity ^0.7.5;

contract myContract {

    mapping (address => uint256) public balances; 
    address payable wallet;

    event Purchase (
	address indexed _buyer,
	uint256 _amount
    );

    constructor (address payable _wallet) public {
	wallet = _wallet; 
    }

    function external payable () {
	buyToken();
    }

    function buyToken () public payable {

    // buy a token
    // send eth to wallet address

	balances[msg.sender] += 1;
	wallet.transfer (msg.value);
	emit Purchase (msg.sender, 1);
    
    }

}
