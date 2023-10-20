import FungibleToken from 0x05
import Becky from 0x05

transaction(receiver: Address, amount: UFix64) {

    prepare(signer: AuthAccount) {
        // Borrow the Becky Minter reference
        let minter = signer.borrow<&Becky.Minter>(from: /storage/MinterStorage)
            ?? panic("Only Becky Owner has acess")
        
        // Borrow the receiver's Becky Vault capability
        let receiverVault = getAccount(receiver)
            .getCapability<&Becky.Vault{FungibleToken.Receiver}>(/public/Vault)
            .borrow()
            ?? panic("Check your Vault status")
        
        // Minted tokens reference
        let mintedTokens <- minter.mintToken(amount: amount)

        // Deposit minted tokens into the receiver's Becky Vault
        receiverVault.deposit(from: <-mintedTokens)
    }

    execute {
        log("Coins minted and deposited successfully")
        log(amount.toString().concat(" Coins sucessfully minted"))
    }
}
