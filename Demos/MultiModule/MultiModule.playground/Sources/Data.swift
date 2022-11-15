import Foundation


public protocol DataProviding {
    func fetch()
}
public class Data: DataProviding {
    public init(auth: AuthProviding) {
        self.auth = auth
    }
    
    private var auth: AuthProviding
    public func fetch() {
        print("Data - Data")
        auth.provide()
    }
}
