//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

@resultBuilder
public struct Module {
    public static func buildBlock<T>(_ dependencies: T...) -> Void {
        let module = dependencies[0] as! DependencyModuleType
        module.dependencies.forEach { dep in
            Resolver.inject(dependency: dep.type, named: (dep.named.isEmpty ? String(
                String(describing: dep.self)
                    .drop(while: { $0 != Character("<")})
                    .split(separator: ">")
                    .first?.dropFirst() ?? ""
                    
            ) : dep.named))
        }
    }
}
