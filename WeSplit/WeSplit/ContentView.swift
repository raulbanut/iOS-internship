//
//  ContentView.swift
//  WeSplit
//
//  Created by Banut Raul on 10.03.2022.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = "Ron"
    
    @State private var amount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    var currencyType: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currencyCode ?? "RON")
    }
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = amount / 100 * tipSelection
        let grandValue = amount + tipValue
        let amountPerPerson = grandValue / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = amount / 100 * tipSelection
        let grandValue = amount + tipValue
        
        return grandValue
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Amount", value: $amount, format: currencyType)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        //                        ForEach(tipPercentages, id: \.self) {
                        //                            Text($0, format: .percent)
                        //                        }
                        ForEach(0..<101) {
                            Text("\($0)%")
                        }
                    }
                    //                    .pickerStyle(.segmented)
                    //                    .pickerStyle(.wheel)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: currencyType)
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(totalAmount, format: currencyType)
                } header: {
                    Text("The total amount with tip")
                }
                
                //                Section {
                //                    Picker("Select your student: ", selection: $selectedStudent) {
                //                        ForEach(students, id: \.self) {
                //                            Text($0)
                //                        }
                //                    }
                //                }
                //
                //                Section {
                //                    Text("Hello, world!")
                //                }
                //
                //                Group {
                //                    Text("Hello, world!")
                //                    Text("Hello, world!")
                //                }
                //
                //                Section {
                //                    TextField("Enter you name", text: $name)
                //                    Text("Hello \(name)")
                //                }
                //
                //                Section {
                //                    Button("Tap Count: \(tapCount)") {
                //                        tapCount += 1
                //                    }
                //                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
