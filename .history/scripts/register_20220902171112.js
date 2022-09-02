const hre = require("hardhat");
const bankAppAbi = require("./abi/BankAppAbi");

async function main() {
  const signers = await hre.ethers.getSigners();
  const contactAddress =
    "0xc6a46ec6229c3245f35a66e178046172fa611755940a0afbb21af67ff913110a";
  const account0 = signers[0].address;

  // metamask wallet

  console.log("MyAddress: " + account0);

  const bankAppContract = new hre.ethers.Contract(
    contactAddress,
    bankAppAbi,
    signers[0]
  );

  console.log(
    "Register-Result: " +
      (await bankAppContract
        .connect(signers[0])
        .register(2331, account0, "Lois Lane", "A233casd", 0)),
    {
      gasLimit: 1000000,
    }
  );
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
