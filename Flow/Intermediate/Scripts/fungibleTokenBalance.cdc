import FungibleToken from 0x05

// get balances of FungibleToken vault
pub fun main(user: Address): {UInt64: UFix64} {

    // Get user's account
    let authAccount = getAuthAccount(user)
    
    // variable that stores vault unique identifiers and balances
    var vaults: {UInt64: UFix64} = {}

    // Iterate through items in the account's storage
    authAccount.forEachStored(fun(path: StoragePath, type: Type): Bool {
        // if the item is a FungibleToken vault...
        if type.isSubtype(of: Type<@FungibleToken.Vault>()) {
            // ...Borrow reference to the FungibleToken vault
            let vaultRef = authAccount.borrow<&FungibleToken.Vault>(from: path)!

            vaults[vaultRef.uuid] = vaultRef.balance
        }
       
        return true
    })

    
    return vaults
}
