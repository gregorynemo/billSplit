//
//  ContentView.swift
//  billSplit
//
//  Created by Gregory Nemo II on 7/10/20.
//  Copyright © 2020 Gregory Nemo II. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("This is your \(name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
