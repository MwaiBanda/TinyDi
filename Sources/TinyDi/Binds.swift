//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

@propertyWrapper
public struct Binds<T> {
    var wrappedValue: T
    var named: String
    
    init(wrappedValue: T, named: String = "") {
        self.wrappedValue = wrappedValue
        self.named = named
        Resolver.inject(dependency: self.wrappedValue, named: named)
    }
}
