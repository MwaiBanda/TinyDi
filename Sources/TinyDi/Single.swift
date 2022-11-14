//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation


public struct Single<T>: SingleType {
    var type: T
    var named: String
    
    public init(_ type: T, named: String = "") {
        self.named = named
        self.type = type
    }
}
