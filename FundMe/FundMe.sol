// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract FundMe {
    
    uint public minimumUsd = 5e18;

    // who sends us money
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable {
        // Allow users to send $
        // Have a minimum $ sent $5
        // 1. How do we send ETH to this contract?
        require(getConversionRate(msg.value) > minimumUsd, "didn't send enough ETH"); // 1e18 = 1ETH
        // msg.sender = globalna funkcija, ki pove kateri address je poslau
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // function withdraw() public {}

    function getPrice() public view returns(uint256){
        // Za Eth
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI - rabmo za iterakcijo s pogodbo, interface nam to omogoči
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        // Price of ETH in terms of USD
        // 2000.00000000
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        // We get price for 1 Eth
        uint256 ethPrice = getPrice();
        // Delimo ker imata oba 18 decimalnih mest
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns (uint256) {
        // here we call functions in that contract
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}