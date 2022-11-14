//
//  DependencyRegistry.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

public final class DependencyRegistry {
     public func clear(onCompletion: @escaping () -> Void) {
          Resolver.clear(onCompletion: onCompletion)
      }
      static public let shared = DependencyRegistry()
      private init() { }
}
