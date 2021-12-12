require("@nomiclabs/hardhat-waffle");
const fs = require('fs');
const privateKey = fs.readFileSync("secrets.js").toString().trim();

module.exports = {
  solidity: "0.8.4",
  networks: {
    matic: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [privateKey]
    },
    rinkeby: {
      url: "https://eth-rinkeby.alchemyapi.io/v2/sL5r3xGMlVrf5ZnyNcfbnVJ1JYl3UCro",
      accounts: [privateKey]
    }
  }
};
