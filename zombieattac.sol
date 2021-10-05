// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.9.0;

import "./zombiehelper.sol";

contract ZombieBattle is ZombieHelper {

    uint randNonce = 0;
    uint attackVictoryProbability = 70;

    function randMode(uint _modulus) internal returns(uint) {
        randNonce++;
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % _modulus;    
    }

    function attack(uint _zombieId, uint _targetId) external {
        
    }
    
}