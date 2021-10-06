// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.9.0;

import "./zombieattack.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

    function blanceOf(address _owner) external view returns (uint256) {
        return ownerZombieCount[_owner];
    }

    function ownerOf(uint256 _tokenId) external view returns (address) {
        return zombieToOwner[_tokenId];
    }

}