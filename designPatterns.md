## Design Patterns
References: rubygarage.org   
Design Patterns: Elements of Reusable object oriented software.  
Design patterns are used to represent many best practices adapted by object oriented systems. It describes the problem, the solution, when to apply the solution, and its consequences.     
There are ***3 main types of software design patterns***
1. Creational
2. Structural
3. Behavioral

### Creational
Deals with object creation mechanisms. They try to instantiate objects up to the right situation.  
***Example of creational design patterns:***
1. Factory Method
2. Abstract Factory
3. Builder
4. Singleton
5. Prototype

### Structural
They aim to simplify design by finding the easy way to realize relationships between classes and objects.  
***Examples of structural design pattern:***
1. Adapter
2. Bridge
3. Facade
4. Decorator
5. Composite
6. Flyweight
7. Proxy


### Behavioral    
Identifies common communication patterns between entities and then implement these patterns.  
***Examples of behavioral design patterns:***
1. Observer
2. Chain of Responsibility
3. Template Method
4. Command
5. Iterator
6. Mediator
7. Memento
8. Strategy
9. State
10. Visitor


### Most Common Used Design Patterns
Design patterns can be incredibly useful if used in the right situations. They also provide a common language to conceptualize repeated problems and solutions. And here we'll look in to the most common design patterns - When to apply them, and an example use case.

#### Builder
As it implies, the builder pattern is used to build objects. It allows you to create complex objects from simple objects step by step. You can use the same code for different object views.  
The builder design pattern separates the construction of an object from its own class. This means that construction of objects are assigned to many different special ***builder objects*** which are split in to multiple steps.  
To create an object: You call ***builder methods*** which you wouldn't need to go through all the steps, but only those required to create your object that has specific configuration.

**When to apply the builder pattern:**  
• when a constructor has too many parameters and it gets hard to read and manage  
• when your code base needs to create different views of a specific object  
• when you need to compose complex objects

**Example of use case**  
When you’re developing an iOS app for a restaurant and need to implement the ordering functionality. You can create 2 structs ***Dish*** and ***Order*** with the help of an ***OrderBuilder*** object.  
[Check out the code!]()

#### Adapter
Adapter is a structural design pattern that allows incompatible interfaces to work with each other. This works by transforming 1 interface of an object, to adapt it with a different object.
The Adapter ***wraps the object***, concealing it completely from another object. An example would be wrapping an object that handles meters with an adapter that converts data(in our case the data from an object that handles meters) into feet.

**When to apply the adapter pattern:**  
• when you need to use several existing subclasses but they’re mostly all different in functionality, and you can’t extend the superclass  
• when you want to use third party class but the interface doesn’t match the rest of your application’s code.  

**Example of use case**  
If you want to create an events sort of app, and implement a calendar. You should implement the ***EventKit framework*** from Apple and adapt the ***Event*** model from the framework, to work with models in your application! The adapter can wrap the model of the framework and make it compatible with the model in your application.  
[Check out the code!]()


#### Decorator
Decorator is a structural design pattern similar to the adapter design pattern. It allows you to dynamically attach new functionalities to an object by wrapping them in useful wrappers.   
This design pattern is also actually called ***the wrapper***. It describes the core idea behind the design pattern which is — You place a target object inside another wrapper object that triggers the basic behavior from the target object, but then also adds its own behavior to the result.  
Both of these objects will ***share the same interface*** so it doesn’t matter for the user of which object they interact with(either clean or wrapped).   
You can also use several wrappers simultaneously and get the combined behavior from all of them!

**When to apply the decorator pattern:**  
• when you want to add responsibilities to objects dynamically and hide those objects from the code that uses them  
• when you can not extend responsibilities of an object through inheritance.

**Example of use case**  
If you want to ***implement data management*** in your iOS application. You can create 2 decorators: ***EncryptionDecorator*** for encrypting and decrypting data, and ***EncodingDecorator*** for encoding and decoding!  
[Check out the code!]()



#### Facade
It's a Structural design pattern that provides a simple interface to a library, framework, or complex system of classes.  
The  facade provides a simple interface for working with complex subsystems containing many classes. It has limited functionality that you can extend by using a complex subsystem directly. The simplified interface has features that the client needs while hiding all others.   

**When to apply the facade pattern:**  
• when you want to provide a simplified/unified interface to a complex subsystem.  
• when you want to decompose a subsystem into separate layers.

**Example of use case**  
Say we want to create an app that supports audio recording and playback and you need to create the functionality for that. You can use facade pattern to ***hide the implementation*** of services responsible for the file system(FileService), audio sessions(AudioSessionService), audio recording(RecordingService), and audio playback(PlayerService). This easily provides a simplified interface for this complex system of classes!  
[Check out the code!]()


#### Template Method
It's a Behavioral design pattern which ***defines*** a skeleton for an algorithm, as well as ***delegates responsibility*** for some steps to subclass. It allows subclasses to redefine certain steps of its algorithm without changing its overall structure!  
It splits an algorithm into a sequence of steps, describes the steps in separate methods, and lastly, calls them consecutively with the help of a single template method.

**When to apply the template method pattern:**  
• when subclasses need to extend a basic algorithm without changing their structure
• when you have several classes that are responsible for the quite similar actions. Meaning that you'll need to change your class if the other class has been modified.

**Example of use case**  
Say your application has the ability to take pictures and save them. This means that your application will need to ask permission to use the camera and image gallery. To do this, we can create a ***PermissionService*** base class that has a specific algorithm. Now since we have 2 functionalities we want to create, we can create 2 subclasses: ***CameraPermissionService***, and ***PhotoPermissionService***. These subclasses will redefine certain steps of the algorithm while keeping other steps the same.
[Check out the code!]()


#### Singleton
Singletons limit the creation of a class to only 1 object. This is beneficial for when we only need 1 object to handle/coordinate actions across the system. Some examples that we have likely used before are `URLSession.shared`, `FileManager.default`, `UserDefaults.standard`, etc.  
But there are some side effects that you will need to account for one of which is global access. We must ensure that 1 and only 1 object ever gets created. This can be done by making the constructor `private` to the class that we intend to being the singleton. That way, only the members of the class can access the private constructor and no other can.  

**Creating a singleton in Swift**  
• There's a most straight forward way to create a singleton is by defining a global variable. Meaning that any object in the module has access to the singleton object. *Note: Global variables are initialized lazily!*.  
However, doing it this way, by declaring it global, causes a downside where you can't declare you're (singleton) class private meaning that multiple instances of the class *can* be instantiated(NOT the main goal of singletons). And, it causes cluttering of global namespace.  
• A better implementation is using ***static property*** and ***private initializer***. Meaning that we're accessing the singleton(a static let property) declared inside the class. *Note: Static properties are also initialized lazily!*.   
• Another way you can go about this is similar to the style above, but we're instantiating the singleton object in a closure. Thus allows for more complex initialization and configuration of the singleton object.  
Check out the code of singleton creation on this [link](https://github.com/SarinSwift/iOSResearch/blob/master/singletons.playground/Contents.swift)!

Using singletons in your project doesn't mean you have to access them from anywhere in your project. You can use ***dependency injection*** to pass the singleton object to the objects that need it!  
By adopting dependency injection to pass singletons around, the interface of your class describes its dependancies. Making it clear and transparent showing which objects the class needs to perform its duties.


#### Factory Method
Objects are created by calling a factory method instead of calling a constructor. This design pattern solves the problem of creating product objects without specifying their concrete classes. Factory method defines a method which is used for creating objects instead of direct constructor call.  
Often combined with singleton and object pool patterns.

**Implementation:**  
• Specified in an interface or protocol and implemented by child classes  
• Or either implemented in a base class and optionally overridden by derived classes  

Ways in execution  
• Some function within a class will call the the factory method supplying it with all the arguments to select the implementation class desired  
• The factory method then executes based upon the arguments passed in to create an instance of that desired class  
• Once an instance of the desired class is created, the factory method returns to the calling component a reference to that newly created object!  

**When to apply the factory method pattern:**  
• use this when there is a choice to be made between classes that implement a shared protocol or base class  
• can also work when a calling component can rely on the existence of only 1 single base type

**Example of use case**  
• There exists several similar objects and they share the same parent class or conform to the same protocol. Example would be if we have a Car class and several other classes(Truck, SportsCar, SUV) that conform to this parent Car class  
• A decision is to be made on which of these objects to instantiate   
[Check out the code!](https://github.com/SarinSwift/iOSResearch/blob/master/factoryMethod.playground/Contents.swift)  


#### Chain of Responsibility
This design pattern allows a chain of different objects(all inherited from the same class/interface) to pass on the responsibility of executing a piece of logic to another object. So it's like chaining the receiving objects and pass the request along the chain until an object handles it! Note that every UIResponder has a method called `next()` which this method returns the next responder in the responder chain, or `nil` if there's no next responder object.      
It consists of a ***source of command objects***, and a ***series of processing objects***. Each processing object contains has logic that defines the types of command objects it can handle. So if that certain command object isn't in the processing object, then it will be passed on to the next processing object in the chain.  
You can generally say the idea behind this design pattern is to decouple senders and receivers by giving multiple objects the ability to handle a request. And the object that made the request will have no explicit knowledge of who will handle it (so the request has an ***implicit receiver***).

**When to apply the chain of responsibility pattern:**  
• use this pattern when you have a group of related objects handling similar events, but varies depending on event types/attributes/user choices/user inputs/etc.  
• when you want to issue a specific request to one of many objects without specifying the receiver explicitly  
• this design pattern is often applied in conjunction with the Composite design pattern. Where a component's parent can act as its successor.

**Example of use case**  
• The Cocoa and Cocoa Touch frameworks actively use the chain of responsibility pattern for handling events! Objects in the chain are called ***Responder Objects***, inheriting from the UIResponder class.  
Examples of responder objects: UIView, UIViewController, UIWindow, UIApplication.  
When a view receives an event that it can't handle, it dispatches it to its superview until it reaches the view controller or window object(UIWindow). If the window can't handle the event, the event will finally dispatch to the application object(UIApplication) which is the ***last object in the chain***.  
Since a view controller lies in the responder chain, after all of it's managed subviews, it can intercept any view events and handle them. It's typical to handle view events in the view controller.  

**Benefits and Liability**  
• reduced coupling. An object only has to know that the request will be handled appropriately. The receiver and the sender have no explicit knowledge of each other, furthermore, the objects in the chain wouldn't need to know about the chain's structure.  
• simplifies object interconnections. So, instead of all objects having references to all receivers, they keep a single reference to their successors(which means the next object in the chain).  
• adds flexibility to assigning responsibilities among objects. You can add or change responsibilities of handling a request by modifying the chain at runtime.  
• there's no guarantee that the request will be handled(the request can fall off the end of the chain).  
• a request can also go unhandled if the chain is not properly configured.


#### Command
We encapsulate the request as an object which includes all the information needed to perform an action or trigger an event at a later time. The information includes: a method name, the object that owns the method, and values for the method parameters.  
The pattern allows you to model the concept of executing an action. It encapsulates information to perform an action into a command object. Th object can be stored and passed around like other objects. The key to this pattern is an ***abstract Command class***.  
Mainly involving 3 component types: - The ***invoker*** to store and execute the class. - The command that encapsulates the action as an object. - The receiver which is the object acted upon by the command.

**When to apply the command pattern:**  
• commands are an objeect-oriented replacement for call backs. You can express parametrization in a procedural language with a ***callback*** function. Callback functions are registered somewhere to be called at a later point.  
• they can *specify*, *queue*, and *execute* requests at different times. If the receiver of the request can be represented in an address space independent way, then you can ***transfer a command object*** for the request to a different process and full fill the request there!  
• support undo. the commnand's exectute operation can store state for reversing effects in the command itself. But the command must have an ***unexecute*** operation to reverse the effects of a previous call to execute.  
• supports logging changes. they can be reapplied in case of a system crash.  
• supports high level operations which are common in information systems that support ***transactions***. Commands have a common interface making you invoke all transactions the same way, and, it's easy to extend the system with new transactions.



#### Strategy
Is a behavioral pattern that allows grouping related algorithms under an abstraction, allowing to switch out an algorithm/policy for another without modifying the client.  

**When to apply the strategy pattern:**  
• many different classes differ only in their behavior since strategy pattern allows you to configure a class with one of many behaviours.  
• when you need different variabts of an alogorithm. Strategies can be used when variants are implemented as a class hierarchy of algorithms.  
• when an algorithm uses data that clients shouldn't know about. You can use strategy to avoid exposing complex, algorithm specific data structures.   
• another way to identify when to use this pattern is when your code contaisn many conditional statements.

**Benefits and drawbacks**  
• allows family of related algorithms. Inheritance can help factor out common functionality of the algorithm.  
• is an alternative to subclassing. Encapsulating the algorithm in separate strategy classes lets you vary the algorithm independantly of its context - making it easier to switch, understand, and extend.  
• strategy eliminates conditional statements. becasue when different bahaviors are lumped in to 1 class, it's hard to avoid using conditionals to select the right behaviour. Encapsulating the bahaviour in separate strategy classes eliminated these conditional statements.  
• it provides different implementations of the same behavior.  
• clients must understand the different strategies before implementing one. That means that you should use this pattern only when the variation in bahavior is relevant the the clients  
• increased number of objects. Sometimes you can reduce this overhead by implementing strategies as stateless objects that contexts can share.
