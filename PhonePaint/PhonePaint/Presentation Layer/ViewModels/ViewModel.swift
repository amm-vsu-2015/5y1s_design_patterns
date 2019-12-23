//
//  SwiftUIView.swift
//  PhonePaint
//
//  Created by Павел Маринченко on 12/15/19.
//  Copyright © 2019 pavbox. All rights reserved.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var graphs: [CGFloat] = [2, 1, 3]
    @Published var color: Color = Color.red
}
