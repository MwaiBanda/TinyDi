//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

public protocol Resolving {
    public static func resolve<T>(named: String) -> T
    public static func inject<T>(dependency: T, named: String)
    public static func register(context: (Resolving) -> Void)
    public static func clear(onCompletion: @escaping () -> Void)
    public static func release<T>(_ dependency: T, named: String)
    public func resolve<T>() -> T
    public func resolve<T>(named: String) -> T
    public func inject<T>(_ dependency: T, named: String)
    public func release<T>(_ dependency: T, named: String)
    public func clear(onCompletion: @escaping () -> Void)
}
