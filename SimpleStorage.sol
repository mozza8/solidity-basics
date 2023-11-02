
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
    uint256 public favoriteNumber; // 0

    // public makes like a getter function

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // marked view means that it's just gonna read state from the blockchain
    // doesn't make a transaction
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
}