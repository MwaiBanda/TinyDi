import XCTest
@testable import TinyDi


final class TinyDiTests: BaseXCTestCase {
    @Inject private var data: DataProviding


    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()

    }
    func testExample() throws {
        data.provide()
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
     
        XCTAssertEqual(String(describing: data),String(describing: "TinyDiTests.Data"))
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
    public init(auth: AuthProviding) {
        self.auth = auth
    }
    
    private var auth: AuthProviding
    func provide() {
        print("Data - Data")
        auth.provide()
    }
}

