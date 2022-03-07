import UIKit

// Closures = lambdas

/*
 Closure Expression Syntax
 { (parameters) -> return type in
     statements
 }
 
 reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
     return s1 > s2
 })
 
 Inferring Type From Context
 reversedNames = names.sorted(by:
    { s1, s2 in return s1 > s2 })
 */

let names = ["Chris", "Alex", "Andrei", "Banut", "Zara", "Florin", "George"]

func backward(_ s1:String, _ s2:String) -> Bool {
    return s1 > s2
}

func forward(_ s1:String, _ s2:String) -> Bool {
    return s1 < s2
}

var reversedNames = names.sorted(by: backward)
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )

var ordoredNames = names.sorted(by: forward)

print("Names list \(names)")
print("Names reversed list \(reversedNames)")
print("Names ordored list \(ordoredNames)")


/*
 Trailing Closures
 
 dictionary
 */

let digitNames = [
    0: "Zero", 1:"One", 2:"Two", 3:"Three", 4:"Four",
    5: "Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine"
]

let numbers = [16, 58, 515]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

print("Numbers are \(strings)")


/*
 Capturing Values
 
 A closure can capture constants and variables from the surrounding context in which it’s defined. The closure can then refer to and modify the values of those constants and variables from within its body, even if the original scope that defined the constants and variables no longer exists.
 */

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

//func incrementer() -> Int {
//    runningTotal += amount
//    return runningTotal
//}

let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

/*
 Escaping Closures
 
 A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns. When you declare a function that takes a closure as one of its parameters, you can write @escaping before the parameter’s type to indicate that the closure is allowed to escape.
 */

/*
 Autoclosures
 
 An autoclosure is a closure that’s automatically created to wrap an expression that’s being passed as an argument to a function. It doesn’t take any arguments, and when it’s called, it returns the value of the expression that’s wrapped inside of it. This syntactic convenience lets you omit braces around a function’s parameter by writing a normal expression instead of an explicit closure.
 */

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print("There are \(customersInLine.count) customers")
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print("There are \(customersInLine.count) customers")
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print("There are \(customersInLine.count) customers")
// Prints "4"

// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"
