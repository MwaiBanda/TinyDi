//
//  SingleType.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

public protocol SingleType {
    associatedtype T: Any
    var type: T { get }
    var named: String { get }
}
