import FungibleToken from 0x05
import FlowToken from 0x05
import Becky from 0x05

transaction(senderAccount: Address, amount: UFix64) {

    let senderVault: &Becky.Vault{Becky.PublicVaultCollection}
    let signerVault: &Becky.Vault
    let senderFlowVault: &FlowToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, FungibleToken.Provider}
    let adminResource: &Becky.Admin
    let flowMinter: &FlowToken.Minter

    prepare(acct: AuthAccount) {
        // Borrow and handle errors
        self.adminResource = acct.borrow<&Becky.Admin>(from: /storage/AdminStorage)
            ?? panic("No Admin Resource")

        self.signerVault = acct.borrow<&Becky.Vault>(from: /storage/VaultStorage)
            ?? panic("No Vault in Becky account")

        self.senderVault = getAccount(senderAccount)
            .getCapability(/public/Vault)
            .borrow<&Becky.Vault{Becky.PublicVaultCollection}>()
            ?? panic("Vault not found in senderAccount")

        self.senderFlowVault = getAccount(senderAccount)
            .getCapability(/public/FlowVault)
            .borrow<&FlowToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, FungibleToken.Provider }>()
            ?? panic("Flow vault not found in senderAccount")

        self.flowMinter = acct.borrow<&FlowToken.Minter>(from: /storage/FlowMinter)
            ?? panic("No Minter")
    }

    execute {
        // Admin withdraws tokens from sender's vault
        let newVault <- self.adminResource.adminGetCoin(senderVault: self.senderVault, amount: amount)        
        log(newVault.balance)
        
        // Deposit withdrawn tokens to signer's vault
        self.signerVault.deposit(from: <-newVault)

        // Mint new FlowTokens
        let newFlowVault <- self.flowMinter.mintTokens(amount: amount)

        // Deposit new FlowTokens to sender's Flow vault
        self.senderFlowVault.deposit(from: <-newFlowVault)
        log("Done!!!")
    }
}
