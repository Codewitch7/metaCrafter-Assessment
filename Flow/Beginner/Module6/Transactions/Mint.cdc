// Import the NonFungibleToken and CryptoPoops contracts from their respective addresses
import NonFungibleToken from 0x05
import CryptoPoops from 0x05

// Define a transaction for minting and depositing an NFT
transaction(recipientAccount: Address, _name: String, _favFood: String, _luckyNo: Int) {
  prepare(signer: AuthAccount) {
   
   // Borrow a reference to the CryptoPoops.Minter from storage
    let minter = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)!

  // Borrow a reference to the recipient's public CryptoPoopsCollection
    let reciever = getAccount(recipientAccount).getCapability(/public/CryptoPoopsCollection)
                    .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
                    ?? panic("No collection linked to account.")

    // Mint the NFT using the reference to the minter
    let nft <- minter.createNFT(name: _name, favouriteFood: _favFood, luckyNumber: _luckyNo)
    
    // Deposit the NFT in the reciever's collection
    reciever.deposit(token: <- nft)
  }

  execute {
    // Log a success message when the NFT is minted and deposited
    log("Transaction successful")
  }
}
