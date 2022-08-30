const hre = require('hardhat');

async function main() {
    const bankApp = await hre.ethers.getContractFactory("BankApp");
    const bankAppInstance = await bankApp.deploy();
    await bankAppInstance.deployed(["Lois Lane"]);
}
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
})