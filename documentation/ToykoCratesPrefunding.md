## `ToykoCratesPrefunding`






### `constructor(uint256 _presaleTokens, uint256 _presalePrice, uint256 _presaleEnd)` (public)



Sets the values for {owner}, {presaleTokens}, {presalePrice}, {presaleEnd}

### `purchasePresaleToken(uint256 _amount)` (public)

Purchase a presale crate
    @param _amount represents the amount of presale crates you are purchasing



### `clearBalance()` (public)

Clears balance of the contract and transfers it to the owner
        @dev Only the owner of the smart contract can sign this transaction



### `setRedemptionContract(address _redemptionAddress)` (public)



Only the owner can sign this function
        @notice Sets the address of the contract that can redeem the tokens
        @param _redemptionAddress is the address of the contract that can redeem tokens




