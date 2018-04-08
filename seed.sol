pragma solidity ^0.4.19;

contract Seed {

    uint plot = 16;
    uint dnaDigits = 8;
    uint dnaModulus = 10 ** dnaDigits;

    struct Seed {
        string name;
        string rarity;
        uint dna;
    }

    Seed[] public seeds;

    function _createSeed(string _name, string _rarity, uint _dna) private {
        seeds.push(Seed(_name, _rarity, _dna));
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