# Swift / Dependency Injection

TinyDi consists is a multi-module dependency injection solution, It uses property wrapper syntax.
To make it easy for you to declare and design.

* Supports Swift functions marked as `@TinyModule` & `@Singleton`.
* Supports Swift variables marked as `@Inject` & `@Binds`.
* Supports SwiftUI and UIKit 

### Installation
A detailed guide for installation can be found in Installation Guide.

Swift Package Manager
File > Swift Packages > Add Package Dependency <br>
Add https://github.com/MwaiBanda/TinyDi.git <br>
branch main


## Table of contents

<!--- TOC -->

* [Introduction and references](#introduction-and-references)
* [Installation](#installation)
* [Setup](#setup)
  * [initial](#gradle)
    * [Extending the Dependenpce Registry](#extending-the-dependenpce-registry)
    * [Using Injected dependencies`](#using-apply-plugin-the-old-way)
  * [Modules](#android)
    * [Using `@TinyModule`](#using-tinymodule)
    * [Named Insertion](#named-insertion)
  * [Retrival](#retrival)
  * [Named Retrival](#named-retrival)
  * [Testing](#testing)

<!--- END -->

* **Additional links**
  * [Singleton Example](docs/serialization-guide.md)
  * [Multi-Module Example](https://kotlinlang.org/api/kotlinx.serialization/)
  * [Production Example](https://kotlinlang.org/api/kotlinx.serialization/)

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
<!--- TEST_NAME ReadmeTest -->


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

#### Injecting dependencies

TinyDi offers multiple ways to for you to provide your dependencies. Dependencies can be provide with 
the following property-wrappers `@Singleton`, `Binds` & `@TinyModule`:

Singleton:

```swift

```

Binds:

```swift

```
TinyModule:
```swift

```

#### Using Injected Dependencies

There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected
words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't.

Inject:

```swift

```

Inject(named: `String`):

```swift

```

Within a Module:

```swift

```

### Modules

There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected
words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't.

There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected
words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't.

```swift

```

There are many variations of passages of Lorem Ipsum available:

```swift

```

### Retrival

There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected
words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't.

### Named Retrival

There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected
words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't.

### Testing

There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected
words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't.
