const hre = require("hardhat");

async function main() {
  //gets the smart contract
  const contractFactory = await hre.ethers.getContractFactory("nftContract");
  //mines it
  const contract = await contractFactory.deploy();
  //waits for the transaction to be mined
  await contract.deployed();

  console.log("Contract deployed to:", contract.address);
}

main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});
