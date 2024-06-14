const hre = require("hardhat");

async function main() {
  const BlockSparkToken = await hre.ethers.getContractFactory("BlockSparkToken");
  const blockSparkToken = await BlockSparkToken.deploy(100000000, 50);

  await oceanToken.deployed();

  console.log("Ocean Token deployed: ", blockSparkToken.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});