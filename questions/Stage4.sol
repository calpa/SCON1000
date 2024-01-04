// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Stage4 is ERC20 {
    uint public timeLock = block.timestamp + 10 * 365 days;
    address public owner;
    string public stageName = 'Stage4';

    constructor() ERC20("LockCoin", "LOCK") {
        owner = msg.sender;
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    function transfer(
        address _to,
        uint256 _value
    ) public override lock returns (bool) {
        super.transfer(_to, _value);
        return true;
    }

    modifier lock() {
        if (msg.sender == owner) {
            require(block.timestamp > timeLock);
            _;
        }
    }

    function claim() public payable {
        require(
            balanceOf(0xA9C20eA5433fF128B6B48dCDB18814124e99CaaA) >=
                30 * 10 ** decimals()
        );
        selfdestruct(payable(msg.sender));
    }
}
