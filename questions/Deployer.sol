// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./Stage1.sol";
import "./Stage2.sol";
import "./Stage3.sol";
import "./Stage4.sol";
import "./Stage5.sol";

contract Deployer {
    address[] public deployedStages;

    function deploy() public {
        Stage1 s1Contract = new Stage1();
        address _address1 = address(s1Contract);

        Stage2 s2Contract = new Stage2();
        address _address2 = address(s2Contract);

        Stage3 s3Contract = new Stage3();
        address _address3 = address(s3Contract);

        Stage4 s4Contract = new Stage4();
        address _address4 = address(s4Contract);

        Stage5 s5Contract = new Stage5();
        address _address5 = address(s5Contract);

        deployedStages.push(_address1);
        deployedStages.push(_address2);
        deployedStages.push(_address3);
        deployedStages.push(_address4);
        deployedStages.push(_address5);
    }

    function get() public view returns (address[] memory) {
        return deployedStages;
    }
}
