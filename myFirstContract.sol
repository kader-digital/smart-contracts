pragma solidity ^0.7.5;

contract myContract {

    uint256 public peopleCount = 0;
    uint256 openingTime = 1544669573;
    address owner;

    modifier onlyWhileOpen () {
	require (block.timestamp >= openingTime); 
	_;
    }

    mapping (uint => Person) public people;

    struct Person {
    
	uint _id;
	string _firstname;
	string _lastname;
    
    }

    constructor () public {
	owner = msg.sender; 
    }

    function addPerson (string memory _firstname, string memory _lastname) public onlyWhileOpen {
	incrementCount();
	people[peopleCount] = Person(peopleCount, _firstname , _lastname);
    }

    function incrementCount () internal {
	peopleCount += 1;
    }

}
