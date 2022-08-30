const hre = require('hardhat');

async function main() {
    const bankApp = await hre.ethers.getContractFactory("BankApp");
    const bankAppInstance = await bankApp.deploy(["Lois Lane"]);
    await bankAppInstance.deployed();
}
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
})