//
//  Binds.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

@propertyWrapper
public struct Binds<T> {
    public var wrappedValue: T
    public var named: String
    
    public init(wrappedValue: T, named: String = "") {
        self.wrappedValue = wrappedValue
        self.named = named
        TDi.inject(dependency: self.wrappedValue, named: named)
    }
}
