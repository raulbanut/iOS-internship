import UIKit

let number = 9.0
print(number)

func myMethod() {
    print("Hello World")
}

func max(firstNumber: Int, secondNumber: Int) -> Int {
    if firstNumber > secondNumber {
        return firstNumber
    }
    else {
        return secondNumber
    }
}

let maxNumber = max(10,20)
print(maxNumber)

func temperature(of month: String) -> Double {
    return 9.0
}

var month = "January"

temperature(of: month)

func computeName(firstName: String?, lastName: String?, isPolite: Bool = false) -> String? {
    guard let firstName = firstName, let lastName = lastName else {
        return nil
    }
    let name = firstName + " " + lastName
    return isPolite ? "Mr. " + name : name
}

print(computeName(firstName: "Raul", lastName: "Banut")!)

class Person {
    var firstName: String?
    var lastName: String! = nil
    
    init(_ firstName: String, _ lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        
    }
}

struct PersonStruct{
    var firstName: String
    var lastName: String? = nil
}

let classInstance = Person("Raul", "Banut")
var structInstance = PersonStruct(firstName: "Raul",lastName: "Banut")

classInstance.firstName = "Petru"
structInstance.firstName = "Petrica"

var otherPerson = classInstance
var otherPersonStruct = structInstance

otherPerson.firstName = "Ana"
print(classInstance.firstName)

otherPersonStruct.firstName = "Johny"
print(structInstance.firstName)

enum Mode {
    case dark, light, system
}

func renderUI(for mode: Mode) {
    switch mode {
        case .system:
            print("system")
        case .light:
            print("light")
        default:
            print("default")
    }
}


renderUI(for: .light)
renderUI(for: .dark)
