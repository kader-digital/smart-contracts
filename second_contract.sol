pragma solidity ^0.7.5;

contract ERC20Token {

    string public name;
    mapping (address => uint256) public balances;

    function mint () public {
    
	balances[msg.sender]++;
    
    }

}

contract myContract {

    
    address payable wallet;
    address public token;

    constructor (address payable _wallet, address _token) public {
	wallet = _wallet; 
	token = _token;
    }

    function external payable () {
	buyToken();
    }

    function buyToken () public payable {

	ERC20Token _token = ERC20Token (address(token));
	wallet.transfer (msg.value);
	emit Purchase (msg.sender, 1);
    
    }

}
