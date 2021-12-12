//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "hardhat/console.sol";

//converts string to base64
import { Base64 } from "./libraries/Base64.sol"; 

contract nftContract  is ERC721URIStorage{
    
    using Strings for uint256;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721 ("3bewte", "3BT") {
        //collection name + ID
    }

    //main function to mint the NFTs
    function mintNFT(string memory NFTtokenUri) public {

        //gets current token ID
        uint256 newItemId = _tokenIds.current(); 
        
        //mints it on chain
        _safeMint(msg.sender, newItemId);
        
        //sets token URI
        _setTokenURI(newItemId, NFTtokenUri);

        //increases token ID by 1
        _tokenIds.increment();
    }
}
