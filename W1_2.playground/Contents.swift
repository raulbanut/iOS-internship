import UIKit
import Foundation

var number = 5
if (number % 2 == 0) {
    print("even")
} else {
    print("odd")
}

var numberOne = 12
var numberTwo = 3

if numberOne % numberTwo == 0 {
    print("divisible")
} else {
    print("not divisible")
}

var numberThree = 4

if (numberOne == numberTwo) || (numberOne == numberThree) || (numberTwo == numberThree) {
    print("At least two numbers are the same")
} else {
    print("All numbers are different")
}

var baconAge = 3
var eggsAge = 35

if (baconAge < 7) && (eggsAge < 21) {
    print("you can cook bacon and eggs")
} else {
    if baconAge >= 7 {
        print("throw out bacon")
    }
    if eggsAge >= 21 {
        print("throw out eggs")
    }
}

var leapYear = 2011

if (leapYear % 4 == 0) {
    if (leapYear % 100 == 0) && (leapYear % 400 != 0) {
    print("not a leap year")
    }
    else {
        print("is a leap year")
    }
} else {
    print("not a leap year")
}

var randomNumber = Int.random(in: 1..<100)

if randomNumber % 2 == 0 {
    print("heads")
} else {
    print("tails")
}
