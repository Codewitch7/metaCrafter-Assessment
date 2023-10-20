import FungibleToken from 0x05
import Becky from 0x05

pub fun main(account: Address) {

    // Borrow the public vault capability and handle errors
    let publicVault = getAccount(account)
        .getCapability(/public/Vault)
        .borrow<&Becky.Vault{FungibleToken.Balance}>()
        ?? panic("can't confirm vault, check your setup")

    log("Vault has been confirmed.🚀🚀")
}
