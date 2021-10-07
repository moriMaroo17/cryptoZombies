// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.9.0;

import "./zombieattack.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

    mapping (uint => address) zombieApprovals;

    function blanceOf(address _owner) external view returns (uint256) {
        return ownerZombieCount[_owner];
    }

    function ownerOf(uint256 _tokenId) external view returns (address) {
        return zombieToOwner[_tokenId];
    }

    function _transfer(address _from, address _to, uint256 _tokenId) {
        ownerZombieCount[_to]++;
        ownerZombieCount[_from]--;
        zombieToOwner[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) {
        require(zombieToOwner[_tokenId] == msg.sender || zombieApprovals[_tokenId] == msg.sender);
        _transfer(_from, _to, _tokenId);
    }

    function approve(address _approved, uint256 _tokenId) external payable onlyOwnerOf(_tokenId) {
        zombieApprovals[_tokenId] = _approved;
        Approval(msg.sender, _approved, _tokenId);
    }

}