//
//  CircleView.swift
//  TrafficLightsSwiftUI
//
//  Created by Илья Нечаев on 26.10.2021.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    var alpha: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(alpha)
            .frame(width: 150, height: 150)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .shadow(color: .black, radius: 10)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red, alpha: 0.3)
    }
}
