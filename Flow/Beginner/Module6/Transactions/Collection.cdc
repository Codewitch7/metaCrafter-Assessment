// Import the CryptoPoops contract from address 0x05
import CryptoPoops from 0x05

// Define a transaction for creating a collection
transaction() {
  prepare(signer: AuthAccount) {
    // Check if a collection already exists in the account storage.
    if signer.borrow<&CryptoPoops.Collection>(from: /storage/CryptoPoopsCollection) != nil {
      
      log("You already have a collection")
      return
    }

    // Create a collection in account's storage.
    signer.save(<- CryptoPoops.createEmptyCollection(), to: /storage/CryptoPoopsCollection)

  // Link the new collection to the public interface.
    signer.link<&CryptoPoops.Collection>(/public/CryptoPoopsCollection, target: /storage/CryptoPoopsCollection)

    // Log a message to indicate that the collection has been created.
    log("Collection Created")
  }
}
