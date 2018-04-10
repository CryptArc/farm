pragma solidity ^0.4.19;


contract Plot {
    
    uint dnaDigits = 8;
    uint dnaModulus = 10 ** dnaDigits;
    
    struct Plot {
        
        string seed;
        uint dna;
        
    }
    
    Plot[] public plots;
    
    mapping (uint => address) public plotToOwner;
    mapping (address => uint) ownerPlotCount;
    
    
    
}