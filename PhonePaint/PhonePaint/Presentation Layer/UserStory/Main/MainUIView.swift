//
//  MainUIView.swift
//  PhonePaint
//
//  Created by Павел Маринченко on 12/21/19.
//  Copyright © 2019 pavbox. All rights reserved.
//

import SwiftUI

struct MainUIView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            CanvasUIView()
                .frame(width: 150, height: 150, alignment: .leading)
        }
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}

//struct Header: View {
//    @ObservedObject var env: ViewModel
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            Text("HEADER")
//            Text("HEADER 2")
//            ForEach(env.graphs, id: \.description) { (graph) in
//                Text(String(describing: graph))
//            }
//        }
//    }
//}
//
//struct ContentView: View {
//    @ObservedObject var env: ViewModel
//    var body: some View {
//        Form {
//            Text("Hello, World!")
//            Header(env: env)
//        }
//    }
//}
