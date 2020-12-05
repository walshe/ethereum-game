
const Token = artifacts.require("./GameToken");
const Marketplace = artifacts.require("./Marketplace");

module.exports = (deployer) => deployer
.then(() => createToken1())
.then(() => createToken2())
.then(() => createToken3())
.then(() => mintTokens());


//all these functions call functions on same instance of the Token ERC1155 contract .. create/mint etc

async function createToken1(){
    //create takes initial supply and optional uri
    (await Token.deployed()).create(0, "");
}

async function createToken2(){
    (await Token.deployed()).create(0, "");
}

async function createToken3(){
    (await Token.deployed()).create(0, "");
}

async function mintTokens(){
    Token.deployed().then( instance => {
        //mint and assign to marketplace
        instance.mint(1, [Marketplace.address], [30])
        instance.mint(2, [Marketplace.address], [20])
        instance.mint(3, [Marketplace.address], [10])
    })
}
