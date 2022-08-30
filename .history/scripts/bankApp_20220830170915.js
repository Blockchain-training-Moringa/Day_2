const hre = require('hardhat');

async function main() {
    const bankApp = await hre.ethers.getContractFactory("BankApp");
    const bankAppInstance = await bankApp.deploy(["Lois Lane"]);
    await bankAppInstance.deployed();

    await bankAppInstance.register(
      1,
      "0x3a55972c007648b0B6Afa7C1419e",
      "Lois Lane",
      "A233casd",
      0
    );
}
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
})