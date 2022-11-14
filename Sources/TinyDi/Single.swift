//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation


struct Single<T>: SingleType {
    var type: T
    var named: String
    
    init(_ type: T, named: String = "") {
        self.named = named
        self.type = type
    }
}
