require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  networks: {
    hardhat: {},
    mumbai: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/1cKxXeFZGzf5TP89Or1IlXUlh0yJc5EL",
      accounts:
        "0e3b5e8837da9321ed2cc43122677638d0be452f2dea45248fecb773100350ba",
      chainId: 80001,
    },
  },
};
