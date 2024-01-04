// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Stage1 {
    string public stageName = 'Stage1';

    function claim() public payable {
        selfdestruct(payable(msg.sender));
    }

    receive() external payable {}

    fallback() external payable {}
}
