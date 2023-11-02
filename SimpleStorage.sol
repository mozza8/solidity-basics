
// SPDX-License-Identifier: MIT

pragma solidity 0.8.18; // stating our version

// Basic Types: boolean, uint, int, address, bytes
    // bool hasFavoriteNumber = true;
    // uint256 favoriteNumber = 88;
    // string favoriteNumberInText = "88";
    // int256 favoriteInt = -88;
    // address myAddress = 0x91BBe942f9d39284a098f838b296Fe0284654215;
    // bytes32 favoriteBytes32 = "cat";

    // every type has default value

contract SimpleStorage {
    // favorite number get initialised as 0 if no value is given
    // uint256 public favoriteNumber; // 0
    // public makes like a getter function

    uint256  myfavoriteNumber;

    uint256[] listOfFavoriteNumbers;

    // creating a custom type
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // you have to define type on both sides
    // Person public pat = Person({favoriteNumber: 7, name: "Pat"});
    // Person public jon = Person({favoriteNumber: 35, name: "Jon"});

    // dynamic array
    Person[] public listOfPeople;

    // static array -- can only has defined number of items (3)
    // Person[3] public listOfPeople;

    // creates dictionary like type
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myfavoriteNumber = _favoriteNumber;
    }

    // marked view means that it's just gonna read state from the blockchain
    // doesn't make a transaction
    function retrieve() public view returns(uint256) {
        return myfavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // v EVMu lahko shraniš informacije na 6 različnih mest:
    // Stack, memory, storage, calldata, code, logs
}