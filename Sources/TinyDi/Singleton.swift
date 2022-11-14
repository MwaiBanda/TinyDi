//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

@resultBuilder
public struct Singleton {
    public static var named: String = ""
    
    public init(named: String = ""){
        Singleton.named = named
    }
    
    public static func buildBlock<T>(_ dependencies: T...) -> Void {
            dependencies.forEach { dependency in
                Resolver.inject(dependency: dependency, named: named)
            
        }
    }
}




