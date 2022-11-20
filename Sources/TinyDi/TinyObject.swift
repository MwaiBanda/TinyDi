//
//  TinyObject..swift
//  
//
//  Created by Mwai Banda on 11/19/22.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
@propertyWrapper
public struct TinyObject<T>: DynamicProperty where T: ObservableObject {
    @State var object: T? = nil
    @MainActor
    public var wrappedValue: T {
        get {
            if (object != nil) {
                return object!
            } else {
                return TDi.resolve()

            }
        }
        nonmutating set {
            object = newValue
            TDi.inject(dependency: newValue, named: String(describing: T.self))
        }
    }
    public init(wrappedValue thunk: @autoclosure @escaping () -> T) {
        TDi.inject(dependency: thunk(), named: String(describing: T.self))
        object = thunk()
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
