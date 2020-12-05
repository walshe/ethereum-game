pragma solidity 0.5.0;

import "../lib/ERC1155.sol";


contract Marketplace {

    ERC1155 private _token;

    //prices for each token type
    mapping(uint256 => uint256) price;

    // this contract is reponsible for owning items from the game that will be
    // sold to players. It takes payments and transfers tokens
    constructor(ERC1155 token) public {
        require(address(token) != address(0));
        _token = token;

        //prices in wei
        price[1] = 100000000000000; //pumps coins faster
        price[2] = 200000000000000; //super boots
        price[3] = 300000000000000; //time warp cape
    }

    // if someone calls contract but fails to specify function name then at
    // least let them attempt to buy something
    function () external payable{
        buyToken(1);
    }


    function buyToken(uint256 tokenId) payable public {
        uint256 weiAmount = msg.value;
        require(weiAmount >= price[tokenId] && price[tokenId] != 0);

        _token.safeTransferFrom(address(this), msg.sender, tokenId, 1, "");


    }

    // ensure receiver can receive the token, returns hash
    function onERC1155Received(address _operator, address _from, uint256 _id, uint256 _value, bytes calldata _data) external returns(bytes4){
        return bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"));
    }

}
