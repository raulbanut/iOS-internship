import UIKit

enum Account {
    case empty
    case funds(remaining: Int)
    case credit(amount: Int)
    
    var remainingFunds: Int {
        switch self {
            case .empty: return 0
            case .funds(let remaining): return remaining
            case .credit(let amount): return amount
        }
    }
}

protocol AccountCompatible {
    var remainingFunds: Int { get }
    mutating func addFunds(amount: Int) throws
    mutating func removeFunds(amount: Int) throws
}


extension Account: AccountCompatible {
    
    mutating func removeFunds(amount: Int) throws {
        try self.addFunds(amount: amount * -1)
    }
    
    mutating func addFunds(amount: Int) throws {
        var newAmount = amount
        if case let .funds(remaining) = self {
            newAmount += remaining
        }
        
        if newAmount < 0 {
            self = .credit(amount: newAmount)
        } else if newAmount == 0 {
            self = .empty
        } else {
            self = .funds(remaining: newAmount)
        }
    }
}


var account = Account.funds(remaining: 20)

try? account.addFunds(amount: 10)
print(account.remainingFunds)


// Mutating

struct Stack {
    /*
     public keyword is used to indicate that we can access the items array variable when we create an instance of the struct
     private keyword is used to mean that we can only set the value of the items array inside the struct
     if someone try to assign a new array to items array after creating an instance of the struct, the compiler will yell.
     */
    public private(set) var items = [Int]() // Empty items array
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int? {
        if !items.isEmpty {
            return items.removeLast()
        }
        return nil
    }
}

var stack = Stack()
stack.push(4)
stack.push(78)
stack.items
stack.pop()
stack.items


// Extensions

enum Entity {
    case soldier(x: Int, y: Int)
    case tank(x: Int, y: Int)
    case player(x: Int, y: Int)
}

extension Entity: CustomStringConvertible {
    var description: String {
        switch self {
            case let .soldier(x, y): return "Soldier: \(x), \(y)"
            case let .tank(x, y): return "Tank: \(x), \(y)"
            case .player(x: let x, y: let y):
                return "Player: \(x), \(y)"
        }
    }
}

var soldier = Entity.soldier(x: 2, y: 3)

print(soldier)
