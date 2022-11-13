//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

@propertyWrapper
public struct Inject<T> {
    var named: String
    var wrappedValue: T {
        get {
            Resolver.resolve(named: named)
        }
    }
    init(named: String = ""){
        self.named = named
    }
    
    func release<T>(_ type: T) {
        Resolver.release(type)
    }
    func release() {
        Resolver.release(wrappedValue)
    }
    func release(named: String) {
        Resolver.release(wrappedValue, named: named)
    }
}
