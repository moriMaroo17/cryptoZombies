// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.9.0;

import "./ZombieFeeding.sol";

contract ZombieHelper is ZombieFeeding {

    uint levelUpFee = 0.001 ether;

    modifier aboveLevel(uint256 _level, uint256 _zombieId) {
        require(zombies[_zombieId].level >= _level);
        _;
    }

    function levelUp(uint _zombieId) external payable {
        require(msg.value == levelUpFee);
        zombies[_zombieId].level++;
    }

    function changeName(uint256 _zombieId, string memory _newName)
        external
        aboveLevel(2, _zombieId)
    {
        require(msg.sender == zombieToOwner[_zombieId]);
        zombies[_zombieId].name = _newName;
    }

    function changeDna(uint256 _zombieId, uint256 _newDna)
        external
        aboveLevel(20, _zombieId)
    {
        require(msg.sender == zombieToOwner[_zombieId]);
      	zombies[_zombieId].dna = _newDna;
    }

	function getZombiesByOwner(address _owner) external view returns (uint[] memory) {
		uint[] memory result = new uint[](ownerZombieCount[_owner]);

		uint counter = 0;
		for (uint i = 0; i < zombies.length; i++) {
			if (zombieToOwner[i] == _owner) {
				result[counter] = i;
				counter++;
			}
		}
		return result;

	}
}
