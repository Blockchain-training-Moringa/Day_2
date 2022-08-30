const hre = require('hardhat');

async function main() {
    const BankApp = await hre.ethers.getContractFactory("BankApp");
    const bankApp = await BankApp.deploy(["Lois Lane"]);
    await bankApp.deployed();

    await bankApp.register(
      1,
      "0xdD2FD4581271e230360230F9337D5c0430Bf44C0",
      "Lois Lane",
      "A233casd",
      0
    );
}
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
})