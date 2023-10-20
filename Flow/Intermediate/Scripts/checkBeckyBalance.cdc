import FungibleToken from 0x05
import Becky from 0x05

pub fun main(account: Address) {

   
    let publicVault: &Becky.Vault{FungibleToken.Balance, FungibleToken.Receiver, Becky.PublicVaultCollection}? =
        getAccount(account).getCapability(/public/Vault)
            .borrow<&Becky.Vault{FungibleToken.Balance, FungibleToken.Receiver, Becky.PublicVaultCollection}>()

    if (publicVault == nil) {
        // Create an empty vault if none is present
        let newVault <- Becky.createEmptyVault()
        getAuthAccount(account).save(<-newVault, to: /storage/VaultStorage)
        getAuthAccount(account).link<&Becky.Vault{FungibleToken.Balance, FungibleToken.Receiver, Becky.PublicVaultCollection}>(
            /public/Vault,
            target: /storage/VaultStorage
        )
        log("Empty vault created")
    
        let retrievedVault: &Becky.Vault{FungibleToken.Balance}? =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&Becky.Vault{FungibleToken.Balance}>()
        log(retrievedVault?.balance)
    } else {
        log("Vault exists")
        
        // Borrow the vault capability for further checks
        let checkVault: &Becky.Vault{FungibleToken.Balance, FungibleToken.Receiver, Becky.PublicVaultCollection} =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&Becky.Vault{FungibleToken.Balance, FungibleToken.Receiver, Becky.PublicVaultCollection}>()
                ?? panic("no Vault capability")
        
        // Check if the vault's UUID is in the list of vaults
        if Becky.vaults.contains(checkVault.uuid) {
            log(publicVault?.balance)
            log("This is a Becky vault")
        } else {
            log("not a Becky vault")
        }
    }
}
