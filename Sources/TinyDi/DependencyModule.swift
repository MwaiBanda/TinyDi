//
//  DependencyModule.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

public struct DependencyModule {
    public var dependencies: [any SingleType]
    public init(_ dependencies: [any SingleType]) {
        self.dependencies = dependencies
    }
}

