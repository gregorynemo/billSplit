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
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    var body: some View {
       Text("Hello World.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
