//
//  ContentView.swift
//  billSplit
//
//  Created by Gregory Nemo II on 7/10/20.
//  Copyright © 2020 Gregory Nemo II. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: (Double, Double) {
        let peopleCount = Double(numberOfPeople + 1)
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
                }
                
                Section (header: Text("How many people?")) {
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(1 ..< 6) {
                            Text("\($0)")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
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
