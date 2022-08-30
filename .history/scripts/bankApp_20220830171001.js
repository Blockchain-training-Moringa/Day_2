const hre = require('hardhat');

async function main() {
    const bankApp = await hre.ethers.getContractFactory("BankApp");
    const bankAppInstance = await bankApp.deploy(["Lois Lane"]);
    await bankAppInstance.deployed();

    await bankAppInstance.register(
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