//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

@resultBuilder
public struct Singleton {
    static var named: String = ""
    
    init(named: String = ""){
        Singleton.named = named
    }
    
    static func buildBlock<T>(_ dependencies: T...) -> Void {
        dependencies.forEach { dependency in
            Resolver.inject(dependency: dependency, named: named)
        }
    }
}
