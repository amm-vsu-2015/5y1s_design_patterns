//
//  CanvasUIView.swift
//  PhonePaint
//
//  Created by Павел Маринченко on 12/21/19.
//  Copyright © 2019 pavbox. All rights reserved.
//

import SwiftUI

struct CanvasUIView: View {

    // @Binding private var brushPosition: UnitPoint

    var body: some View {
        VStack {
            Text("kek")
            Rectangle()
                .frame(width: 50, height: 40, alignment: .leading)
            Color(red: 0.5, green: 0.5, blue: 0.5)
                .frame(width: 50, height: 40, alignment: .leading)
            GeometryReader { geometry in
                Path { path in
                    path.addRect(CGRect(x: 0, y: 0, width: 40, height: 40))
                }
                .fill(Color.red)
                .cornerRadius(16)
            }
        }
    }

    private var moveGesture: some Gesture {
        DragGesture().onChanged { (value) in
            print(value)
        }
    }
}

struct CanvasUIView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasUIView()
    }
}
