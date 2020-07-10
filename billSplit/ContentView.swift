//
//  ContentView.swift
//  billSplit
//
//  Created by Gregory Nemo II on 7/10/20.
//  Copyright © 2020 Gregory Nemo II. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            ForEach(0 ..< 100){
                Text("Row \($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
