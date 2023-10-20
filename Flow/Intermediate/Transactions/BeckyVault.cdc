import FungibleToken from 0x05
import Becky from 0x05

transaction() {

    let userVault: &Becky.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, Becky.PublicVaultCollection}?
    let account: AuthAccount

    prepare(acct: AuthAccount) {

        // Borrow vault 
        self.userVault = acct.getCapability(/public/Vault)
            .borrow<&Becky.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, Becky.PublicVaultCollection}>()

        self.account = acct
    }

    execute {
        if self.userVault == nil {
            // Create an empty vault
            let emptyVault <- Becky.createEmptyVault()
            self.account.save(<-emptyVault, to: /storage/VaultStorage)
            self.account.link<&Becky.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, Becky.PublicVaultCollection}>(/public/Vault, target: /storage/VaultStorage)
            log("Empty vault created and linked")
        } else {
            log("Vault already exists and is properly linked")
        }
    }
}
