// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// library is similar to contract, but it can't have variables and functions must be internal

library PriceConverter {
    function getPrice() internal view returns(uint256){
        // Za Eth
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI - rabmo za iterakcijo s pogodbo, interface nam to omogoči
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        // Price of ETH in terms of USD
        // 2000.00000000
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        // We get price for 1 Eth
        uint256 ethPrice = getPrice();
        // Delimo ker imata oba 18 decimalnih mest
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() internal view returns (uint256) {
        // here we call functions in that contract
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}