//
//  Inject.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

@propertyWrapper
public struct Inject<T> {
    public var named: String
    public var wrappedValue: T {
        get {
            Resolver.resolve(named: named)
        }
    }
    public init(named: String = ""){
        self.named = named
    }
    
    public func release<T>(_ type: T) {
        Resolver.release(type)
    }
    public func release() {
        Resolver.release(wrappedValue)
    }
    public func release(named: String) {
        Resolver.release(wrappedValue, named: named)
    }
}
