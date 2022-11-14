//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/13/22.
//

import Foundation

public final class DependencyRegistry {
     func clear(onCompletion: @escaping () -> Void) {
          Resolver.clear(onCompletion: onCompletion)
      }
      static let shared = DependencyRegistry()
      private init() { }
}
