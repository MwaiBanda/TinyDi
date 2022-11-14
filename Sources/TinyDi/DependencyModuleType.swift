//
//  File.swift
//  
//
//  Created by Mwai Banda on 11/14/22.
//

import Foundation

protocol DependencyModuleType {
    var dependencies: [any SingleType] { get }
}
