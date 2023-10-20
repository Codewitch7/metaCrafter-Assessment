import FungibleToken from 0x05
import FlowToken from 0x05

// retrieve the balance of a FlowToken vault
pub fun getFlowVaultBalance(account: Address): UFix64? {

    // Borrow the FlowToken vault capability
    let publicFlowVault: &FlowToken.Vault{FungibleToken.Balance}?
        = getAccount(account)
            .getCapability(/public/FlowVault)
            .borrow<&FlowToken.Vault{FungibleToken.Balance}>()
            
    // if the borrowing was successful
    if let balance = publicFlowVault?.balance {
        return balance
    } else {
        
        return panic("No Flow vault")
    }
}

// Entry point of the script
pub fun main(_account: Address): UFix64? {
    // Call the getFlowVaultBalance function and return the result
    return getFlowVaultBalance(account: _account)
}
