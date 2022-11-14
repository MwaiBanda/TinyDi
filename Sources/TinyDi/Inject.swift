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
            TDi.resolve(named: named)
        }
    }
    public init(named: String = ""){
        self.named = named
    }
    
    public func release<T>(_ type: T) {
        TDi.release(type)
    }
    public func release() {
        TDi.release(wrappedValue)
    }
    public func release(named: String) {
        TDi.release(wrappedValue, named: named)
    }
}
