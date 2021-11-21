const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("test", function () {
  it("should check balance", async function () {
    //gets account of the smart contract deployer
    const [owner] = await hre.ethers.getSigners();
    //gets the smart contract
    const contractFactory = await hre.ethers.getContractFactory("nftContract");
    //mines it
    const contract = await contractFactory.deploy();
    //waits for the transaction to be mined
    await contract.deployed();

    await contract.mintNFT("newNFT","i.ytimg.com/vi/WNukgBtlWeU/maxresdefault");

  });
});
