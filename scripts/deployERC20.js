// Import ethers from Hardhat package
const { ethers } = require("hardhat");

async function main() {
  /*
A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
so nftContract here is a factory for instances of our GameItem contract.
*/
  const mdtContract = await ethers.getContractFactory("AimeToken");

  // here we deploy the contract
  const ERC20Contract = await mdtContract.deploy();

  // print the address of the deployed contract
  console.log("Deployed ERC20 Token Contract Address:", ERC20Contract.address);
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
