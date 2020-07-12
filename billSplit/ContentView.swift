//
//  ContentView.swift
//  billSplit
//
//  Created by Gregory Nemo II on 7/10/20.
//  Copyright © 2020 Gregory Nemo II. All rights reserved.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var morePeople = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    let numberOfPeoples = [1, 2, 3, 4, 5]
    
    var totalPerPerson: (Double, Double) {
        var peopleCount: Double = 0
        if numberOfPeople != 5 {
            peopleCount = Double(numberOfPeople + 1)
        } else {
            peopleCount = Double(morePeople) ?? 0
        }
            
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return (amountPerPerson, grandTotal)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("Enter the bill amount:")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Button("Hide Keyboard") {
                        self.hideKeyboard()
                    }
                }
                
                Section (header: Text("How many people?")) {
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(0 ..< numberOfPeoples.count) {
                            if (self.numberOfPeoples[$0] < 5) {
                                Text("\(self.numberOfPeoples[$0])")
                            } else {
                                Text("5(+)")
                            }
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                if numberOfPeople == 4 {
                    Section {
                        TextField("Enter # of people", text: $morePeople)
                            .keyboardType(.decimalPad)
                        }
                    }
                
                Section (header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Total amount:")) {
                    Text("$\(totalPerPerson.1, specifier: "%.2f")")
                }
                
                Section (header: Text("Total per person:")) {
                    Text("$\(totalPerPerson.0, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Bill Split")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
