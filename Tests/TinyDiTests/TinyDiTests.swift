import XCTest
@testable import TinyDi


final class TinyDiTests: BaseXCTestCase {
    @Inject private var auth: AuthProviding


    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()

    }
    func testExample() throws {
        auth.provide()
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
     
        XCTAssertEqual(String(describing: auth),String(describing: "TinyDiTests.Auth"))
    }
}
protocol AuthProviding {
    func provide()
}
class Auth: AuthProviding {
    func provide() {
        print("Auth")
    }
}


protocol DataProviding {
    func provide()
}
class Data: DataProviding {
    func provide() {
        print("Data")
    }
}

