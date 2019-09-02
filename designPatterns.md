## Design Patterns
References: rubygarage.org    
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
