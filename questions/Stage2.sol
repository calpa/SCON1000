// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Stage2 {
    string public stageName = 'Stage2';

    function claim() public payable {
        require(
            address(this).balance > 30 ether,
            "You need to find the way to feed me"
        );
        selfdestruct(payable(msg.sender));
    }

    receive() external payable {
        require(1 == 2, "GG");
    }

    fallback() external payable {}
}
