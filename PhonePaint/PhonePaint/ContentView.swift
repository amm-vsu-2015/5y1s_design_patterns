//
//  ContentView.swift
//  PhonePaint
//
//  Created by Павел Маринченко on 12/12/19.
//  Copyright © 2019 pavbox. All rights reserved.
//

import SwiftUI

struct Header: View {
    @ObservedObject var env: ViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("HEADER")
            Text("HEADER 2")
            ForEach(env.graphs, id: \.description) { (graph) in
                Text(String(describing: graph))
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var env: ViewModel
    var body: some View {
        Form {
            Text("Hello, World!")
            Header(env: env)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(env: ViewModel())
    }
}
