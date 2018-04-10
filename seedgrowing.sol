pragma solidity ^0.4.19;

import "seed.sol";

contract SeedGrowing is Seed {

	function growAndMultiply(uint _seedId, uint _targetDna) public {
    require(msg.sender == seedToOwner[_seedId]);
    Seed storage mySeed = seeds[_seedId];
    
  }
    
}
