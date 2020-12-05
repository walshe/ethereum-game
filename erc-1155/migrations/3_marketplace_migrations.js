
const Token = artifacts.require("./GameToken");
const Marketplace = artifacts.require("./Marketplace");

module.exports = (deployer) => deployer.then(() => deployMarketplace(deployer));

function deployMarketplace(deployer) {
    //deploy Marketplace, passing in the address of "Token" contract to its constructor
    return deployer.deploy(Marketplace, Token.address);
}
