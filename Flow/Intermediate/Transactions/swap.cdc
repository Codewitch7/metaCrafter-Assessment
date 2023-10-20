import Swap from 0x05

transaction(amount: UFix64) {

    let signer: AuthAccount

    prepare(acct: AuthAccount) {
        self.signer = acct
    }

    execute {
        // Call the SwapToken contract and swap tokens
        Swap.swapTokens(signer: self.signer, swapAmount: amount)
        log("Swap done")
    }
}
