async function main(){
    const myNFTContract = await ethers.getContractFactory('AimeNFT');

    const my_NFTContract = await myNFTContract.deploy();

    console.log("Contract deployed to Address:", my_NFTContract.address);
}   

main()
    .then(() => process.exit(0))
    .catch(error=> {
        console.error(error);
        process.exit((1));
    })