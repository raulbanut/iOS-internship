import UIKit
import CoreGraphics

enum PizzaType: Int {
    case small = 1
    case medium
    case large
    
    var diameter: Float {
        return Float(self.rawValue) * 5.0
    }
}

enum DoctorType {
    case cardio
    case pediatru
    case stomatolog
}

enum EngineerType {
    case software
    case construction
}

enum JobType {
    case doctor(DoctorType)
    case engineer(EngineerType)
    
    var jobDescription: String {
        switch self {
            case .doctor(let type) :
                switch type {
                    case .cardio :
                        return "Doctor cardiolog"
                    case .pediatru :
                        return "Doctor pediatru"
                    case .stomatolog :
                        return "Doctor stomatolog"
                }
            case .engineer(let type) :
                switch type {
                    case .construction :
                        return "Inginer constructii"
                    case .software :
                        return "Programator IT"
                }
        }
    }
}

let job = JobType.engineer(.software)

print(job.jobDescription)
print()

protocol Engine: AnyObject {
    var power: Int { get }
    var size: Double { get }
    
    func computePerformance(distance: Double) -> Double
}

protocol VehiclePart {
    var price: Double { get set }
}

struct DrivingWheel: VehiclePart {
    var price = 1000.4
}

class DieselEngine: Engine, VehiclePart {
    var price: Double = 1000.4
    
    var power: Int
    
    var size: Double
    
    func computePerformance(distance: Double) -> Double {
        let consume = Double(power) * size
        print("The diesel engine consumes \(consume) in 3 hours")
        return distance
    }
    
    init(power: Int, size: Double) {
        self.power = power
        self.size = size
    }
}

func buildCard(from parts: [VehiclePart]) {
    
}

class ElectricEngine: Engine {
    var power: Int
    var size: Double
    
    init(power: Int, size: Double){
        self.power = power
        self.size = size
    }
    
    func computePerformance(distance: Double) -> Double {
        let consume = Double(power) + size
        print("The electric engine consumes \(consume) in 3 hours")
        return distance
    }
}

var engines: [Engine] = [DieselEngine(power: 200, size: 50.0), ElectricEngine(power: 100, size: 49.3)]


func mostEfficient(engines: [Engine], distance: Double) -> Engine {
    var mostPerformantEngine = engines[0]
    for engine in engines {
        let performance = engine.computePerformance(distance: distance)
        if performance < mostPerformantEngine.computePerformance(distance: distance) {
            mostPerformantEngine = engine
        }
    }
    return mostPerformantEngine
}

func getAllDiesels(engines: [Engine]) -> [DieselEngine] {
    var results: [DieselEngine] = []
    for engine in engines {
        if let dieselEngine = engine as? DieselEngine {
            results.append(dieselEngine)
        }
    }
    return results
}

var number: Any = 12
print(number as? String)
print()

print(getAllDiesels(engines: engines))

var compareMethod: (Engine, Engine) -> Bool

func order(engines: [Engine], by compareMethod: (Engine, Engine) -> Bool) -> [Engine] {
    var engines = engines
    for i in 0..<engines.count {
        for j in i..<engines.count {
            if compareMethod(engines[i], engines[j]) == true {
                (engines[i],engines[j]) = (engines[j],engines[i])
            }
        }
    }
    return engines
}

compareMethod = { (a: Engine, b: Engine) in
    return a.computePerformance(distance: 100) < b.computePerformance(distance: 100)
}

print("Compare <")
print(order(engines: engines, by: compareMethod))
print()

compareMethod = { (a: Engine, b: Engine) in
    return a.computePerformance(distance: 100) > b.computePerformance(distance: 100)
}

print("Compare > ")
print(order(engines: engines, by: compareMethod))
print()

extension Int {
    func averaged(with other: Int) -> Int {
        return (self + other) / 2
    }
}

print(3.averaged(with: 5))
