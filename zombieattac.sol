// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.9.0;

import "./zombiehelper.sol";

contract ZombieBattle is ZombieHelper {
    
    uint256 randNonce = 0;
    uint256 attackVictoryProbability = 70;

    function randMode(uint256 _modulus) internal returns (uint256) {
        randNonce++;
        return
            uint256(
                keccak256(
                    abi.encodePacked(block.timestamp, msg.sender, randNonce)
                )
            ) % _modulus;
    }

    function attack(uint256 _zombieId, uint256 _targetId) external {}
}
