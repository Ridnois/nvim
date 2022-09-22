// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MyContract {
  uint private counter = 0;
  function increment() public {
    counter++;
  }

  function getCounter() public view returns (uint) {
    return counter;
  }
}

