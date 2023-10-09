// Define the contract for Courses and Enrollments
pub contract StellarUniversity {

    // Define the Course struct
    pub struct Course {
        pub let courseId: UInt64
        pub let courseName: String

        // Constructor for the Course struct
        init(courseId: UInt64, courseName: String) {
            self.courseId = courseId
            self.courseName = courseName
        }
    }

    // Declare a dictionary to hold Course structs
    pub var courses: {UInt64: Course}

    // Initialize the contract
    init() {
        self.courses = {}
    }

    // Function to add a Course to the dictionary
    pub fun addCourse(courseId: UInt64, courseName: String) {
        let course = Course(courseId: courseId, courseName: courseName)
        self.courses[courseId] = course
    }

    // Function to get a Course by ID
    pub fun getCourse(courseId: UInt64): Course? {
        return self.courses[courseId]
    }
}
