//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import XCTest
@testable import TinyDi
import Foundation

extension DependencyRegistry {
    func injectTest() {
        Resolver.register { resolver in
            authModule()
            dataModule(resolver: resolver)
        }
    }
}
