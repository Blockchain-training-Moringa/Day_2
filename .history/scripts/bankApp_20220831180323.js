const hre = require("hardhat");

async function main() {
  const signers = await hre.ethers.getSigners();
  const account0 = signers[0].address;
  const BankApp = await hre.ethers.getContractFactory("BankApp");
  const bankApp = await BankApp.deploy("Lois Lane");
  await bankApp.deployed();

  await bankApp.register(2331, account0, "Lois Lane", "A233casd", 0);

  await bankApp.login();
  await bankApp.deposit(50);
  await bankApp.checkBalance(account0);
  console.log(await bankApp.checkBalance(account0));
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
