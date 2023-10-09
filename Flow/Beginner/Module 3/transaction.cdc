// Import StellarUniversity
import StellarUniversity from 0x08

// Transaction to add a course
transaction(courseId: UInt64, courseName: String) {
    prepare(acct: AuthAccount) {}

    execute {
        // Call the addCourse function from StellarUniversity
        StellarUniversity.addCourse(courseId: courseId, courseName: courseName)
        log("Course Added")
        log(courseId)
        log(courseName)

    }
}
