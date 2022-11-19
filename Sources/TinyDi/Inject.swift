//
//  Inject.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import SwiftUI

@propertyWrapper
public struct Inject<T>: DynamicProperty {
    public var named: String
    public var wrappedValue: T {
        get {
            TDi.resolve(named: named)
        }
        nonmutating set {
            TDi.inject(dependency: newValue, named: String(describing: T.Type))
        }
    }
    public init(wrappedValue value: T) {
        self.wrappedValue = value
        TDi.inject(dependency: value, named: String(describing: T.Type))
        
    }
    
    public init(initialValue value: T) {
        self.wrappedValue = value
        TDi.inject(dependency: value, named: String(describing: T.Type))
    }
    
    public var projectedValue: StateObject<T> {
        return Binding(get: { return self.wrappedValue }, set: { newValue in self.wrappedValue = newValue })
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
