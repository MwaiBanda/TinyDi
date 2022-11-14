//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation


public struct Single<T>: SingleType {
    public var type: T
    public var named: String
    
    public init(_ type: T, named: String = "") {
        self.named = named
        self.type = type
    }
}
