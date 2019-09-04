import UIKit

// Parent class
class Toy {
    func play() {
    }
}

// Child classes
class Train: Toy {
    override func play() {
        print("choo choo")
    }
}

class Trampoline: Toy {
    override func play() {
        print("Jump high")
    }
}

class Ball: Toy {
    override func play() {
        print("Bounce")
    }
}

class NintendoSwitch: Toy {
    override func play() {
        print("Save Hyrule!")
    }
}

/*
As you can see above there are several toys that share a similar interface through inheritance.
Now we need a way to determine which subclass of toy to create. And here is where the factory method
design pattern kicks in!
*/

class MyToyFactory {

    // where we implement the logic
    static func produceToy(for age: Int) -> Toy {
        switch age {
            case 0...6:
                return Train()
            case 7...9:
                return Trampoline()
            case 10...18:
              return Ball()
            case _ where age > 18:
              return NintendoSwitch()
            default:
              return Ball()
        }
    }
}

// Using the toy factory
let toy = MyToyFactory.produceToy(for: 19)
toy.play()

/*
Using MyToyFactory class allows to consolidate all our creational logic in to 1 place.
Note that the caller didn't need to know how the toy was selected, nor did it know which toy was selected.
Having them all share a parent class(Toy) or conform to a protocol, we allowed the caller to treat any object
returned from the factory method the same way: as a Toy.
*/
