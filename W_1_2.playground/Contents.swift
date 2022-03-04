import UIKit
import Foundation

// https://johncodeos.com/how-to-parse-json-in-ios-using-swift/
//struct ArrayJSONModel: Codable {
//    let employee_id: String
//    let employee_name: String
//    let employee_salary: String
//    let employee_age: String
//
//    enum CodingKeys: String, CodingKey {
//        case employee_id = "id"
//        case employee_name
//        case employee_salary
//        case employee_age
//    }
//}

//struct ArrayJSONModel: Codable {
//    let id: Int
//    let name: String
//    let price: Double
//    let tags: [String]?
//    let dimensions: [String: Double]
//    let warehouseLocation: [String: Double]
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case name
//        case price
//        case tags
//        case dimensions
//        case warehouseLocation
//    }
//}

struct ArrayJSONModelStruct: Codable {
    let id: Int
    let name: String
    let price: Double
    let tags: [String]?
    let dimensions: [String: Double]
    let warehouseLocation: [String: Double]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name
        case price
        case tags
        case dimensions
        case warehouseLocation
    }
}

class ArrayJSONModelClass: Codable {
    let id: Int
    let name: String
    let price: Double
    let tags: [String]?
    let dimensions: [String: Double]
    let warehouseLocation: [String: Double]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name
        case price
        case tags
        case dimensions
        case warehouseLocation
    }
}

let JSONOne = """
[
        {
            "id": 2,
            "name": "An ice sculpture",
            "price": 12.50,
            "tags": ["cold", "ice"],
            "dimensions": {
                "length": 7.0,
                "width": 12.0,
                "height": 9.5
            },
            "warehouseLocation": {
                "latitude": -78.75,
                "longitude": 20.4
            }
        },
        {
            "id": 3,
            "name": "A blue mouse",
            "price": 25.50,
            "dimensions": {
                "length": 3.1,
                "width": 1.0,
                "height": 1.0
            },
            "warehouseLocation": {
                "latitude": 54.4,
                "longitude": -32.7
            }
        }
]
"""


func readLocalJSONFile(forName name: String) -> Data? {
    do {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            return data
        }
    } catch {
        print("error: \(error)")
    }
    return nil
}


let jsonData = readLocalJSONFile(forName: "W1-2-Example")!
let jsonDataOne = JSONOne.data(using: .utf8)!

let jsonClass = try JSONDecoder().decode([ArrayJSONModelClass].self, from: jsonData)
let jsonStruct = try JSONDecoder().decode([ArrayJSONModelStruct].self, from: jsonData)

for item in jsonClass {
    // id
    let id = item.id
    print("id: \(id)")
    
    // name
    let name = item.name
    print("name: \(name)")
    
    // price
    let price = item.price
    print("price: \(price)")
    
    if let tags = item.tags {
        print("tags: \(tags)")
    }
    
    // dimensions
    let dimensions = item.dimensions
    print("dimensions: \(dimensions)")
    
    // warehouseLocation
    let warehouseLocation = item.warehouseLocation
    print("warehouseLocation: \(warehouseLocation)")
    
    print()
}
