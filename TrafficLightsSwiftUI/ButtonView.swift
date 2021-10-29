//
//  ButtonView.swift
//  TrafficLightsSwiftUI
//
//  Created by Илья Нечаев on 28.10.2021.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 40, weight: .medium, design: .default).italic())
                .foregroundColor(.black)
        }
        .padding()
        .frame(width: 200, height: 80)
        .background(Color.white)
        .cornerRadius(15)
    }
}

