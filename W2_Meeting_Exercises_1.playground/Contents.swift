import UIKit
import PlaygroundSupport

//PlaygroundPage.current.needsIndefiniteExecution = true

class Person {
    var name: String
    var kids: [Person] = []
    weak var parent: Person? = nil
    var brother: Person? = nil

    init(name: String, parent: Person? = nil, brother: Person? = nil) {
        self.name = name
        self.parent = parent
        self.brother = brother
    }
    
    deinit {
        print("\(name) was deallocated")
    }
    
    func addChild(person: Person) {
        kids.append(person)
    }
    
    var someClosure: (() -> Void)?
    
    func setSomeClosure(_ callback: @escaping () -> Void) {
        self.someClosure = callback
    }
    
}

class Program {
    var root: Person? = nil
    
    func main() {
        let personOne = Person(name: "Adam")
        self.root = personOne
        let personTwo = Person(name: "Andrei", parent: personOne)
        let personThree = Person(name: "Raluca", parent: personOne)
        
        personOne.addChild(person: personTwo)
        personOne.addChild(person: personThree)
//        personTwo.brother = personThree
//        personThree.brother = personTwo
        
        // ---------
        personThree.brother = personTwo
        personTwo.setSomeClosure { [weak personThree] in
            print(personThree?.name)
        }
        
        // some other functionality
        
    }
    
    deinit {
        print("Program instance was deallocated")
    }
    
}



var program: Program? = Program()



program?.main()
sleep(3)
program = nil
print("Program execution has ended")



