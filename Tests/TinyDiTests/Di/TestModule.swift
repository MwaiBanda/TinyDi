//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/14/22.
//

import Foundation
import XCTest
@testable import TinyDi

@TinyModule
func authModule() {
    Module(
        Single<AuthProviding>(Auth())
    )
}

@TinyModule
func dataModule(resolver: TinyDi) {
    Module(
        Single<DataProviding>(Data(auth: resolver.resolve()))
    )
}


