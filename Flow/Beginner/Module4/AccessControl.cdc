access(all) contract SomeContract {

    pub var testStruct: SomeStruct

    pub struct SomeStruct {

        // Variable 'a' can be read and modified in Areas 1, 2, 3, and 4
        pub(set) var a: String

        // Variable 'b' can be read in Areas 1, 2, 3, and 4
        // It can be modified in Area 1 only
        pub var b: String

        // Variable 'c' can be read in Areas 1, 2, and 3
        // It can be modified in Area 1 only
        access(contract) var c: String

        // Variable 'd' can be read and modified in Area 1 only
        access(self) var d: String

        // Function 'publicFunc' can be called in Areas 1, 2, 3, and 4
        pub fun publicFunc() {}

        // Function 'contractFunc' can be called in Areas 1, 2, and 3
        // It has access within the contract only
        access(contract) fun contractFunc() {}

        // Function 'privateFunc' can be called in Area 1 only
        // It has access within the struct only
        access(self) fun privateFunc() {}

        pub fun structFunc() {
            /**************/
            /*** AREA 1 ***/
            /**************/
        }

        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }
    }

    pub resource SomeResource {
        pub var e: Int

        pub fun resourceFunc() {
            /**************/
            /*** AREA 2 ***/
            /**************/
        }

        init() {
            self.e = 17
        }
    }

    pub fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    pub fun questsAreFun() {
        /**************/
        /*** AREA 3 ****/
        /**************/
    }

    init() {
        self.testStruct = SomeStruct()
    }
}
