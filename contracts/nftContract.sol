//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "hardhat/console.sol";
import { Base64 } from "./libraries/Base64.sol";

contract nftContract  is ERC721URIStorage{
    
    using Strings for uint256;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721 ("AnvittaClub", "AVC") {

    }

    function setMetadata(string memory _NFTname, string memory _description, string memory _NFTurl) private pure returns(string memory) {
        return Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        _NFTname,
                        '", "description":',
                        _description,
                        '"image": "https://',
                        _NFTurl, '.jpg',
                        '"}'
                    )
                )
            )
        );
    }
    

    function mintNFT(string memory NFTname, string memory NFTdescription, string memory NFTurl) public {

        uint256 newItemId = _tokenIds.current();
        console.log(newItemId);

        string memory json = setMetadata(NFTname, NFTdescription, NFTurl);
        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        console.log("\n",finalTokenUri);
        
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, finalTokenUri);
        _tokenIds.increment();
    }
}
