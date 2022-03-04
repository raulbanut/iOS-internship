import UIKit

var a = 64
var b:Double = Double(a)
var c:Int = a as Int

/* You are given 2 Doubles a and b. Print their average. */
var numberOne = 10.5
var numberTwo = 2.3
print("average is \((numberOne + numberTwo) / 2)")

/*
 You are given 3 grades stored in 3 variables of type Double finalsGrade, midtermGrade, projectGrade.
 These grades are used to compute the grade for a class. finalsGrade represents 50% of the grade.
 midtermGrade represents 20% of the grade. projectGrade represents 30% of the final grade.
 Print the grade for the class.
 */
var finalsGrade = 2.0
var midtermGrade = 4.0
var projectGrade = 3.0
var grade = 1.0
grade = 0.5 * finalsGrade + 0.2 * midtermGrade + 0.3 * projectGrade
print("grade is \(grade)")

/*
 You have the cost of a meal at a restaurant stored in a variable mealCost of type Double.
 You would like to leave a tip of a certain percentage. The percentage is stored in a variable tip of type Int.
 Print the total cost of the meal.
 */
var mealCost:Double = 3.5
var tip:Int = 20

var tipCost = mealCost * Double(tip) / 100.0
var totalCost = mealCost + tipCost

print("total cost is \(totalCost)")

/*
 You are given a variable number of type Double. Create a new variable called roundedNumber that has at most 1digit after the decimal dot.
 */
var number = 5.12331
var intNumber = Int(number * 10.0)
var roundedNumber = Double(intNumber) / 10.0

/*
 You are given three grades obtained by 3 students in a class stored in variables grade1, grade2, grade3 of type Double.
 You are also given your grade in the class stored in a variable yourGrade of type Double.
 Print above average if your grade is greater than the class average or below average” otherwise.
 Note: the average of the class includes your grade.
 */
var grade1:Double = 5.0
var grade2:Double = 6.0
var grade3:Double = 7.5
var myGrade:Double = 8.0

var classAverage = (grade1 + grade2 + grade3 + myGrade) / 4
if (myGrade > classAverage) {
    print("above average")
} else {
    print("below average")
}

/*
 A farmer is harvesting wheat from a number of wheat fields, given in a variable numberOfFields of type Int.
 Each field produces the same quantity of wheat given in a variable wheatYield of type Double.
 Sometimes the harvest is increased by 50% due to favorable weather conditions. You are given this information in a variable weatherWasGood of type Bool.
 Print the total amount of wheat that the farmer will harvest.
 */
var numberOfFields:Int = 5
var wheatYield:Double = 7.5
var weatherWasGood:Bool = true

var totalWheat = Double(numberOfFields) * wheatYield

if weatherWasGood {
    totalWheat = totalWheat + 0.5 * totalWheat
}
print("Total wheat is \(totalWheat)")
