import NonFungibleToken from 0x05
import CryptoPoops from 0x05

// Public function to retrieve NFT metadata based on the given ID from an account's public collection.

pub fun main(acctAddress: Address, id: UInt64): &NonFungibleToken.NFT {
    
    // Acquire access to the CryptoPoops.Collection in the account's public collection.
    let contract = getAccount(acctAddress).getCapability(/public/CryptoPoopsCollection)
      .borrow<&CryptoPoops.Collection>() ?? panic("unable to borrow collection ref")

 // Borrow a reference to the NFT metadata using the borrowAuthNFT function
  let metadata = contract.borrowAuthNFT(id: id)

 // Return the borrowed NFT metadata reference
  return metadata
}
