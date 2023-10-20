// Import the FungibleToken and FlowToken contracts from address 0x05
import FungibleToken from 0x05
import FlowToken from 0x05

// Transaction for creating a new FlowToken minter with an allowed amount.
transaction (_allowedAmount: UFix64){
    // Declare a reference to the FlowToken Administrator resource
    let admin: &FlowToken.Administrator
    
    // Declare the signer variable for the transaction.
    let signer: AuthAccount

    // Acquire the Administrator resource from signer's storage
    prepare(signerRef: AuthAccount) {
        // Assign the signer reference to the variable
        self.signer = signerRef
          // Acquire the Administrator resource from storage.
        self.admin = self.signer.borrow<&FlowToken.Administrator>(from: /storage/newflowTokenAdmin)
            ?? panic("Only owner has access")
    }

    // Generate a new minter and store it in the storage
    execute {
         // Utilize the createNewMinter function to create a new minter.
        let newMinter <- self.admin.createNewMinter(allowedAmount: _allowedAmount)

        // Save the newly created minter resource in the specified storage path.
        self.signer.save(<-newMinter, to: /storage/FlowMinter)

        // Generate a log message to indicate the successful creation of the Flow minter.
        log("Flow minter created successfully")
    }
}
