const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("test", function () {
  it("should check balance", async function () {
    const [owner] = await hre.ethers.getSigners();
    const contractFactory = await hre.ethers.getContractFactory("nftContract");
    const contract = await contractFactory.deploy();

    await contract.deployed();

    await contract.mintNFT("newNFT","i.ytimg.com/vi/WNukgBtlWeU/maxresdefault");

  });
});
