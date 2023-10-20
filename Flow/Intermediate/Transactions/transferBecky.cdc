import FungibleToken from 0x05
import Becky from 0x05

transaction(receiverAccount: Address, amount: UFix64) {

    // Define references
    let signerVault: &Becky.Vault
    let receiverVault: &Becky.Vault{FungibleToken.Receiver}

    prepare(acct: AuthAccount) {
        // Borrow references and handle errors
        self.signerVault = acct.borrow<&Becky.Vault>(from: /storage/VaultStorage)
            ?? panic("No Vault in Becky's account")

        self.receiverVault = getAccount(receiverAccount)
            .getCapability(/public/Vault)
            .borrow<&Becky.Vault{FungibleToken.Receiver}>()
            ?? panic("Reciever has no vault")
    }

    execute {
        // Withdraw tokens from signer's vault and deposit into receiver's vault
        self.receiverVault.deposit(from: <-self.signerVault.withdraw(amount: amount))
        log("Coins has benn transferred successfully")
    }
}
