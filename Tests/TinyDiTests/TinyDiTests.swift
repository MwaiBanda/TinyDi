import XCTest
@testable import TinyDi
import SwiftUI

class ExampleViewModel: ObservableObject {
    var items = [String]()
    func getItems() {
        items.append("New Word")
        print(items)
    }
}

final class TinyDiTests: BaseXCTestCase {
    @Inject private var data: DataProviding
    @TinyObject private var viewModel = ExampleViewModel()
//    = Data(auth: Auth())
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()

    }
    func dataTest() throws {
        data.provide()
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
     
        XCTAssertEqual(String(describing: data),String(describing: "TinyDiTests.Data"))
    }
    
    func tinyObjectTest() {
        viewModel.getItems()
        XCTAssertEqual([String](), viewModel.items)
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

