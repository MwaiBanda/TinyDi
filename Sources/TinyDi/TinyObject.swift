//
//  TinyObject..swift
//  
//
//  Created by Mwai Banda on 11/19/22.
//

import Foundation
import SwiftUI

@propertyWrapper
public struct TinyObject<T>: DynamicProperty where T: ObservableObject {
    @MainActor
    public var wrappedValue: T {
        get {
            TDi.resolve()
        }
        nonmutating set {
            TDi.inject(dependency: newValue, named: String(describing: T.self))
        }
    }
    @inlinable
    public init(wrappedValue thunk: @autoclosure @escaping () -> T) {
        TDi.inject(dependency: thunk(), named: String(describing: T.self))
    }

    func update(){
        print("Update")
    }
    @MainActor
    public var projectedValue: ObservedObject<T>.Wrapper {
        get {
            TDi.resolve()
        }
        nonmutating set {
            TDi.inject(dependency: newValue, named: String(describing: T.self))
        }
    }
}
