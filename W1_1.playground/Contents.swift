import UIKit

//var a = 1
//var b = 2
//var sum = a+b
//print(String(format: "Sum is %.f", sum))

let secondsInAMinute = 60
let secondsInAHour = 60 * secondsInAMinute
let secondsInADay = 24 * secondsInAHour
let secondsInAYear = 365 * secondsInADay

var width = 1920
var height = 1080

var numberOfPixels = width * height

let sum = 16
let diff = 4

var c = (sum + diff) / 2
var d = sum - c

var areaWidth = 8
var areaHeight = 12
var x = 2
var y = 3

var bigArea = areaWidth * areaHeight
var smallArea = (areaWidth - x) * (areaHeight - y)
var area = bigArea - smallArea

var a = 1
var b = 2
a = a + b
b = a - b
a = a - b

var lastDigit = 123
print(lastDigit % 10)

var dogYears = 50
var dogYearsInHuman = dogYears / 7
print("Dog years \(dogYearsInHuman)")

var xYears = 3
var yTimes = 2
var bob = 12
var alice = (bob + xYears) * yTimes - xYears

var fruits = 17
// 3 oranges for 5 apples
var apples = fruits % 5
var oranges = fruits / 5 * 3
print("apples : \(apples)",
      "oranges : \(oranges)",
      separator: "\n")


