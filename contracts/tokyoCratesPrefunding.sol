// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import "openzeppelin-solidity/contracts/security/Pausable.sol";


contract ToykoCratesPrefunding is Pausable {
  address payable public owner;
  uint256 public presaleTokens;
  uint256 public presaleEnd;
  uint256 public presalePrice;
  address redemptionAddress;

  mapping(address => uint256) public Balances;


  /**
    @dev Sets the values for {owner}, {presaleTokens}, {presalePrice}, {presaleEnd}
   */
  constructor(uint256 _presaleTokens, uint256 _presalePrice, uint256 _presaleEnd){
    owner = payable(msg.sender);
    presaleTokens = _presaleTokens;
    presalePrice = _presalePrice;
    presaleEnd = _presaleEnd;
  }

  /**
    @notice Purchase a presale crate
    @param _amount represents the amount of presale crates you are purchasing
   */
    function purchasePresaleToken(uint256 _amount) public payable whenNotPaused {
        require(_amount * presalePrice == msg.value, "Incorrect amount sent");
        require(
            _amount <= Balances[owner],
            "The requested amount is greater then available"
        );
        Balances[owner] -= _amount;
        Balances[msg.sender] += _amount;
    }



    /**
        @notice Clears balance of the contract and transfers it to the owner
        @dev Only the owner of the smart contract can sign this transaction
     */
    function clearBalance() public payable {
        require(
            msg.sender == owner,
            "Only the owner of the contract can call this function"
        );
        owner.transfer(address(this).balance);
    }


      /**
        @dev Only the owner can sign this function
        @notice Sets the address of the contract that can redeem the tokens
        @param _redemptionAddress is the address of the contract that can redeem tokens
     */

    function setRedemptionContract(address _redemptionAddress) public payable {
        require(
            msg.sender == owner,
            "Only the owner of the contract can call this function"
        );
        redemptionAddress = _redemptionAddress;
    }


}

