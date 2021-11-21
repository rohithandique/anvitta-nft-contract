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

    constructor() ERC721 ("AnvittaClub", "AVC") {
        //collection name + ID
    }

    //creates metadata on-chain from user provided inputs
    function _setMetadata(string memory _NFTname, string memory _description, string memory _NFTurl) private pure returns(string memory) {
        
        //metadata contains name, description and image url
        //additional data can be added
        return Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        _NFTname, 
                        '", "description":',
                        _description,
                        '"image": "https://',
                        _NFTurl,
                        '"}'
                    )
                )
            )
        );
    }
    
    //main function to mint the NFTs
    function mintNFT(string memory NFTname, string memory NFTdescription, string memory NFTurl) public {

        //gets current token ID
        uint256 newItemId = _tokenIds.current(); 
        console.log(newItemId);

        //gets the metadata from given input and creates token URI
        string memory json = _setMetadata(NFTname, NFTdescription, NFTurl);
        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        ); 

        console.log("\n",finalTokenUri);
        
        //mints it on chain
        _safeMint(msg.sender, newItemId);
        
        //sets token URI
        _setTokenURI(newItemId, finalTokenUri);

        //increases token ID by 1
        _tokenIds.increment();
    }
}
