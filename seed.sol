pragma solidity ^0.4.19;

contract Seed {

    event NewSeed(uint seedId, string name, string rarity, uint dna);

    uint plot = 16;
    uint dnaDigits = 8;
    uint dnaModulus = 10 ** dnaDigits;

    struct Seed {
        string name;
        string rarity;
        uint dna;
    }

    Seed[] public seeds;

    mapping (uint => address) public seedToOwner;
    mapping (address => uint) ownerSeedCount;

    function _createSeed(string _name, string _rarity, uint _dna) private {
        seeds.push(Seed(_name, _rarity, _dna));
        uint id = seeds.push(Seed(_name, _rarity, _dna)) - 1;
        seedToOwner[id] = msg.sender;
        ownerSeedCount[msg.sender]++;
        NewSeed(id, _name, _rarity, _dna);
    } 

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomBasicSeed(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createSeed(_name, "basic",randDna);
    }

}
