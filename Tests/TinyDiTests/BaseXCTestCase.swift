//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation
import XCTest
@testable import TinyDi

class BaseXCTestCase: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        DependencyRegistry.shared.clear {
            DependencyRegistry.shared.injectTest()

        }
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
}


