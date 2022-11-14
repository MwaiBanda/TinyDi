//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/14/22.
//

import Foundation
import XCTest
@testable import TinyDi

@Module
func testModule() {
    DependencyModule([
        Single<AuthProviding>(Auth()),
        Single<DataProviding>(Data()),
    ])
}
