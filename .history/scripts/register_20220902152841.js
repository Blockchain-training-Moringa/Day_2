const hre = require("hardhat");
const bankAppAbi = require("./abi/BankAppAbi");

async function main() {
    const signers = await hre.ethers.getSigners();
    const contactAddress = "";
    const account0 = signers[0].address


    // metamask wallet

    console.log("MyAddress: " + account0);

    const bankAppContract = new hre.ethers.Contract(contactAddress, bankAppAbi, signers[0]);

}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
