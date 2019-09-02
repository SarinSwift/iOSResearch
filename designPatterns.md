## Design Patterns
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
When you need to use several existing subclasses but they’re mostly all different in functionality, and you can’t extend the superclass
When you want to use third party class but the interface doesn’t match the rest of your application’s code.  

**Example of use case**  
If you want to create an events sort of app, and implement a calendar. You should implement the ***EventKit framework*** from Apple and adapt the ***Event*** model from the framework, to work with models in your application! The adapter can wrap the model of the framework and make it compatible with the model in your application.
[Check out the code!]()
