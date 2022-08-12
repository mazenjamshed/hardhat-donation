// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Donation {
    uint256 favNumber;

    address public owner;

    mapping(address => uint256) public addressToAmountDonated;

    address[] public supporters;

    constructor() {
        owner = msg.sender;
        favNumber = 9;
    }

    function passOwnership(address payable newOwner) public onlyOwner {
        owner = newOwner;
    }

    function checkFav() public view returns (uint256) {
        return favNumber;
    }

    function setFav(uint256 num) public {
        favNumber = num;
    }

    function Donate() public payable {
        addressToAmountDonated[msg.sender] += msg.value;
        supporters.push(msg.sender);
    }

    function widthdraw() public payable onlyOwner {
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner!");
        _;
    }
}
