//
//  Module.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

@resultBuilder
public struct TinyModule {
    public static func buildBlock<T>(_ dependencies: T...) -> Void {
        if let module = dependencies[0] as? Module {
            module.dependencies.forEach { dep in
                Resolver.inject(dependency: dep.type, named: (dep.named.isEmpty ? String(
                    String(describing: dep.self)
                        .drop(while: { $0 != Character("<")})
                        .split(separator: ">")
                        .first?.dropFirst() ?? ""
                    
                ) : dep.named))
            }
        } else {
            assertionFailure("Can not cast to DependencyModule")
        }
    }
}

