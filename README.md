# Swift • Dependency Injection • TinyDi

TinyDi is a multi-module dependency injection solution. It uses property wrapper syntax,
to make it easy for you to declare & manage your dependencies.

* Supports Swift functions marked as `@TinyModule` & `@Singleton`.
* Supports Swift variables marked as `@Inject` & `@Binds`.
* Supports SwiftUI and UIKit 

### Installation

Swift Package Manager
File > Swift Packages > Add Package Dependency <br>
Add https://github.com/MwaiBanda/TinyDi.git <br>
branch main


## Table of contents

<!--- TOC -->

* [Introduction and references](#introduction-and-references)
* [Installation](#installation)
* [Setup](#setup)
    * [Extending the Dependenpce Registry](#extending-the-dependenpce-registry)
    * [Other ways to provide dependencies](#other-ways-to-provide-dependencies)
    * [Getting dependencies](#getting-dependencies)
* [Testing](#testing)

<!--- END -->

* **Additional links**
  * [Singleton Example](https://github.com/MwaiBanda/TinyDi/tree/main/Demos/Singleton/Singleton.playground)
  * [Multi-Module Example](https://github.com/MwaiBanda/TinyDi/tree/main/Demos/MultiModule/MultiModule.playground)
  * [Production Example](https://github.com/MwaiBanda/Momentum/tree/master/MomentumiOS/MomentumiOS)
## Introduction and references

Here is a small example.

```swift
extension DependencyRegistry {
    func inject() {
        TDi.inject(context: { reslover in
            provideGreeter()
        })
    }
    @Singleton
    private func provideGreeter() {
        Greeter(greeting: "Hello, Tiny World!")
    }
}

func main() {
    
    // MARK: Call initialisation function
    DependencyRegistry.shared.inject()
    
    // MARK: Dependency Retrival
    @Inject var greeter: Greeter
    print(greeter.greeting)
    
}
``` 

> You can get the full code [here](https://github.com/MwaiBanda/TinyDi/blob/main/Demos/Singleton/Singleton.playground/Contents.swift).


## Setup
TinyDi alllows for easy separations of cocerns, the library follows the dependency rule participularily with modules, dependencies within
a module can not depend on each other within the same module. To start, you have to extend the `Dependenpce Registry` class

#### Extending the `Dependenpce Registry`

You can place up the extension function app file



```swift
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
```       



```swift
func main() {
    
    // Step 4 :: Call initialisation function
    DependencyRegistry.shared.inject()
    
    // MARK: Dependency Retrival
    @Inject var greeter: Greeter
    print(greeter.greeting)
    
}
```
> You can get the full code [here](https://github.com/MwaiBanda/TinyDi/blob/main/Demos/Singleton/Singleton.playground/Contents.swift).

#### Other ways to provide dependencies

TinyDi offers other ways to for you to provide your dependencies. Dependencies can be provide with 
the following property-wrappers  & `@TinyModule` & `@Binds`:


<b>@TinyModule</b>: <br>
Functions prefixed with `@TinyModule` allow you to build modules of dependencies within them.
Modules allow easier separation of different dependencies.

```swift
@TinyModule
func singletonModule(){
    Module(
        Single(Auth.auth(), named: "Auth"), // Optional naming of dependencies within a module
        Single(DatabaseDriverFactory())
    )
}
```
> You can get the full code [here](https://github.com/MwaiBanda/Momentum/blob/master/MomentumiOS/MomentumiOS/Di/SingletonModule.swift).

In cases were you need dependencies from another module, make `(resolver: TinyDi)` the function
signature. With reference to the resolver you can call `resolver.resolve()` in place of the required 
dependency

```swift
@TinyModule
func controllerModule(resolver: TinyDi) {
    Module(
        Single<TransactionController>(TransactionControllerImpl(driverFactory: resolver.resolve())),
        Single<AuthController>(AuthControllerImpl())
    )
}
```
> You can get the full code [here](https://github.com/MwaiBanda/Momentum/blob/master/MomentumiOS/MomentumiOS/Di/ControllerModule.swift).

After creating your modules, add them to the Dependency Registry

```swift
extension DependencyRegistry {
    func inject() {
        TDi.inject { resolver in
            singletonModule()
            controllerModule(resolver: resolver)
        }
    }
}
```
> You can get the full code [here](https://github.com/MwaiBanda/Momentum/blob/master/MomentumiOS/MomentumiOS/iOSApp.swift).

<b>@Binds</b>: <br>
Variables prefixed with the `@Binds` allow you provide dependencies in them. A typical usecase would be dependency inversion

```swift
extension DependencyRegistry {
    func inject() {
        TDi.inject { resolver in
            singletonModule()
            controllerModule(resolver: resolver)
            
            @Binds var authController: AuthController = {
                AuthControllerImpl()
            }()
        }
    }
}
```

```swift
extension DependencyRegistry {
    func inject() {
        TDi.inject { resolver in
            singletonModule()
            controllerModule(resolver: resolver)
            
            @Binds var authId: String = {
                Auth.auth().currentUser?.id ?? ""
            }()
        }
    }
}
```
> You can get the full code [here](https://github.com/MwaiBanda/Momentum/blob/master/MomentumiOS/MomentumiOSTests/Di/DiRegistry.swift).


In cases, were you want to bind dependencies of the same type. Use `@Binds(named: "SomeKey")` to differentiate 
one from the other.

<b>@Binds(named: `String`)</b>:

```swift
extension DependencyRegistry {
    func inject() {
        TDi.inject { resolver in
            singletonModule()
            controllerModule(resolver: resolver)
           
            @Binds(named: "APIKey") var apiKey: String = {
                 "XXX.xxx.xx.00"
            }()
        }
    }
}
```
> You can get the full code [here](https://github.com/MwaiBanda/Momentum/blob/master/MomentumiOS/MomentumiOSTests/Di/DiRegistry.swift).


#### Getting Dependencies

Variables prefixed with the `@Inject` allow you retrive dependencies from them by 
declaring an explicity type variable 

<b>@Inject</b>:

```swift
class TransactionViewModel: ObservableObject {
    @Inject private var controller: TransactionController
...
```
Alternatively, you can retrive specific named dependencies

<b>@Inject(named: `String`)</b>:

```swift
class AuthViewModel: ObservableObject {
    @Inject(named: "Auth") private var auth: Auth
...
```

### Testing
TinyDi can also be used to provide your test dependencies 

<b>Step 1</b>: <br>
Create your test modules

```swift
import Foundation
import XCTest
@testable import TinyDi

@TinyModule
func authModule() {
    Module(
        Single<AuthProviding>(Auth())
    )
}

@TinyModule
func dataModule(resolver: TinyDi) {
    Module(
        Single<DataProviding>(Data(auth: resolver.resolve()))
    )
}
```
> You can get the full code [here](https://github.com/MwaiBanda/TinyDi/blob/main/Tests/TinyDiTests/Di/TestModule.swift).

<b>Step 2</b>: <br>
Extend `DependencyRegistry` & create an initialisation function then add your modules

```swift
import XCTest
@testable import TinyDi
import Foundation

extension DependencyRegistry {
    func injectTest() {
        TDi.inject { resolver in
            authModule()
            dataModule(resolver: resolver)
        }
    }
}

```
> You can get the full code [here](https://github.com/MwaiBanda/TinyDi/blob/main/Tests/TinyDiTests/DependencyRegistry.swift).

<b>Step 3</b>: <br>
Create a base test class

```swift
import Foundation
import XCTest
@testable import TinyDi

class BaseXCTestCase: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        DependencyRegistry.shared.clear {
            DependencyRegistry.shared.injectTest()

        }
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
}
```
> You can get the full code [here](https://github.com/MwaiBanda/TinyDi/blob/main/Tests/TinyDiTests/BaseXCTestCase.swift).

<b>Use dependencies</b>

```swift
final class TinyDiTests: BaseXCTestCase {
    @Inject private var data: DataProviding


    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        _data.release()

    }
...
```
> You can get the full code [here](https://github.com/MwaiBanda/TinyDi/blob/main/Tests/TinyDiTests/TinyDiTests.swift).
