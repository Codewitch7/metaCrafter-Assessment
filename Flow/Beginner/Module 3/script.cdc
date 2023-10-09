// Import StellarUniversity
import StellarUniversity from 0x08

// Function to retrieve a student by ID from the StellarUniversity
pub fun main(id: UInt64): StellarUniversity.Course? {
    // Call the getCourse function from StellarUniversity
    return StellarUniversity.getCourse(courseId: id)!
}
