
import UIKit
import TinyDi

// MARK: Dependency Creation
// Step 1 :: Create a dependency
struct Greeter {
    let greeting: String
}
// MARK: Dependency Insertion
// Step 1 :: Extend DependencyRegistry
extension DependencyRegistry {
    
    // Step 2 :: Create an initialisation function
    func inject() {
        
        TDi.inject(context: { reslover in
            
            // Step 3.b :: reference provider function
            provideGreeter()
         
        })
        
    }
    // Step 3.a :: Create a provider function for a dependency
    @Singleton
    private func provideGreeter() {
        Greeter(greeting: "Hello, Tiny World!")
    }
}



func main() {
    
    // Step 4 :: Call initialisation function
    DependencyRegistry.shared.inject()
    
    // MARK: Dependency Retrival
    @Inject var greeter: Greeter
    print(greeter.greeting)
    
}


main()
