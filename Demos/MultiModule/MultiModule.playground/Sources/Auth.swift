import Foundation

public protocol AuthProviding {
    func provide()
}
public class Auth: AuthProviding {
    public init() { }
    public func provide() {
        print("Auth")
    }
}
