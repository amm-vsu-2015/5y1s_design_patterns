//
//  ContentView.swift
//  PhonePaint
//
//  Created by Павел Маринченко on 12/12/19.
//  Copyright © 2019 pavbox. All rights reserved.
//

import SwiftUI

struct Header: View {
    var body: some View {
        Text("HEADER")
    }
}

struct ContentView: View {
    var body: some View {
        Form {
            Text("Hello, World!")
            Header()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
