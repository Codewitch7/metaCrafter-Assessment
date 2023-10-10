// Import the NonFungibleToken and CryptoPoops contracts from their respective addresses
import NonFungibleToken from 0x05
import CryptoPoops from 0x05

// Define a public function to retrieve NFT IDs from an account's public collection
pub fun main(acctAddress: Address): [UInt64] {
    
    // Borrow a reference to the public CryptoPoopsCollection associated with the account
    let refAccount = getAccount(acctAddress).getCapability(/public/CryptoPoopsCollection)
                    .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
                    ?? panic("No collection linked to account.")

    // retrieve NFT IDs from the public collection
    return refAccount.getIDs()
}
