//
//  Resolver.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

public final class TDi: TinyDi {
    
    public private(set) var dependencies = [String: AnyObject]()
    public static let shared = TDi()
    
    public static func inject<T>(dependency: T, named: String){
        shared.inject(dependency, named: named)
    }
    
    public static func resolve<T>(named: String = "") -> T {
        shared.resolve(named: named)
    }
    public static func inject(context: (TinyDi) -> Void) {
        context(shared)
    }
    public static func clear(onCompletion: @escaping () -> Void) {
        shared.clear(onCompletion: onCompletion)
    }
    public static func release<T>(_ dependency: T, named: String = "") {
        shared.release(dependency, named: named)
    }
    public func inject<T>(_ dependency: T, named: String = "") {
        let key = (named.isEmpty ? String(describing: T.self) : named)
        dependencies[key] = dependency as AnyObject
    }
    public func resolve<T>() -> T {
        let key = String(describing: T.self)
        let dependency = dependencies[key] as? T
        assert(dependency != nil, "No dependency found of \(key)")
        return dependency!
    }
    
   
    public func resolve<T>(named: String = "") -> T {
        let key = (named.isEmpty ? String(describing: T.self) : named)
        let dependency = dependencies[key] as? T
        assert(dependency != nil, "No dependency found of \(key)")
        return dependency!
    }
    
    public func release<T>(_ dependency: T, named: String) {
        let key = (named.isEmpty ? String(describing: T.self) : named)
            .replacingOccurrences(of: ".Protocol", with: "")
        dependencies[key] = nil
        print("[AFTER RELEASE]: \(dependencies)")
    }
    
    public func clear(onCompletion: @escaping () -> Void) {
        dependencies.removeAll()
        onCompletion()
    }
    private init() { }
}
