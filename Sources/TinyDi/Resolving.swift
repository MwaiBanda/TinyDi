//
//  Resolving.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

public protocol Resolving {
    static func resolve<T>(named: String) -> T
    static func inject<T>(dependency: T, named: String)
    static func register(context: (Resolving) -> Void)
    static func clear(onCompletion: @escaping () -> Void)
    static func release<T>(_ dependency: T, named: String)
    func resolve<T>() -> T
    func resolve<T>(named: String) -> T
    func inject<T>(_ dependency: T, named: String)
    func release<T>(_ dependency: T, named: String)
    func clear(onCompletion: @escaping () -> Void)
}
