//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

struct DependencyModule {
    var dependencies: [any SingleType]
    init(_ dependencies: [any SingleType]) {
        self.dependencies = dependencies
    }
}

