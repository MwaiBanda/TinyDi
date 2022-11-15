import Foundation
import TinyDi

// MARK: Module Creation
// Step 1.a ::  Add the @TinyModule function annotation

@TinyModule
func singletonModule() {
    Module (
        Single(Greeter(greeting: "Hello, Tiny World!")),
        Single<AuthProviding>(Auth())
    )
}

// Step 1.b ::  Create multiples with the @TinyModule function annotation that depend on dependenceies in other modules

@TinyModule
func controllerModule(reslover: TinyDi) {
    Module (
        Single<DataProviding>(Data(auth: reslover.resolve()))
    )
}



// MARK: Dependency Insertion
// Step 1 :: Extend DependencyRegistry
extension DependencyRegistry {
    
    // Step 2 :: Create an initialisation function
    func injectModules() {
        
        TDi.inject(context: { reslover in
            
            // Step 3.b :: add modules
            singletonModule()
            controllerModule(reslover: reslover.resolve())
         
        })
        
    }
    // Step 3.a :: Create a provider function for a dependency
   
}



func main() {
    DispatchQueue.main.async {
        
        // Step 4 :: Call initialisation function
        DependencyRegistry.shared.injectModules()
        
        // MARK: Dependency Retrival
        @Inject var data: DataProviding
        data.fetch()
        
        @Inject var greeter: Greeter
        print(greeter.greeting)
    }
    
}


