import UIKit

/*
 Write a program that writes “I will not skip the fundamentals!” N times.
 */
var n = 5
var times = 0
while times < n {
    print("I will not skip the fundamentals!")
    times = times + 1
}

/*
 Print the first N square numbers. A square number, also called perfect square,
 is an integer that is obtained by squaring some other integer; in other words,
 it is the product of some integer with itself (ex. 1, 4 = 2 * 2, 9 = 3 * 3 …).
 */
n = 10
var number = 1
while number < n {
    print(number * number)
    number = number + 1
}

/*
 Print the powers of 2 that are less than or equal to N.
 */
n = 10
var power = 2
while power <= n {
    print(power)
    power = power * 2
}

/*
 Write all the numbers from 1 to N in alternative order, one number from the left side (starting with one)
 and one number from the right side (starting from N down to 1).
 */
n = 15
var left = 1
var right = n

while left < right {
    print(left)
    print(right)
    left = left + 1
    right = right - 1
}

if left == right {
    print(left)
}

/*
 Given an integer N draw a square of N x N asterisks. Look at the examples.
 */
n = 5
for _ in 1...n {
    for _ in 1...n {
        print("*",terminator: "")
    }
    print("")
}
print()

/*
 Given two integers N and M draw a rectangle of N x M asterisks. Look at the examples.
 */
n = 5
var m = 3
for _ in 1...n {
    for _ in 1...m {
        print("*",terminator: "")
    }
    print("")
}
print()

/*
 Given an integer N draw a triangle of asterisks.
 The triangle should have N lines, the i-th line should have iasterisks on it.
 */
n = 5
for i in 1...n {
    for _ in 1...i {
        print("*",terminator: "")
    }
    print()
}
print()

/*
 Given an integer N draw a pyramid of asterisks. The pyramid should have N lines.
 On the i-th line there should be N-i spaces followed by i*2-1 asterisks.
 */
n = 4
for i in 1...n {
    for _ in 0..<(n-i) {
        print(" ", terminator: "")
    }

    for _ in 1...2*i-1 {
        print("*", terminator: "")
    }
    print("")
}
print()

/*
 Given an integer N draw a rhombus of asterisks, like the ones in the examples.
 */
n = 4

for i in 1...n {
    for _ in 0..<(n-i) {
        print(" ", terminator: "")
    }

    for _ in 1...2*i-1 {
        print("*", terminator: "")
    }
    print("")
}

if (n > 1) {
    for j in 2...n {
        let i = n - j + 1
        for _ in 0..<(n-i) {
            print(" ", terminator: "")
        }

        for _ in 1...2*i-1 {
            print("*", terminator: "")
        }
        print("")
    }
}
