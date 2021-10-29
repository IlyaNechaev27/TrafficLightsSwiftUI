//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Илья Нечаев on 26.10.2021.
//

import SwiftUI

enum ThreeColor {
    case red, green, yellow
}

struct ContentView: View {
    @State private var buttonTitle = "START"
    @State private var currentLight = ThreeColor.red
    
    private func nextColor() {
        switch currentLight {
        case .red: currentLight = .yellow
        case .green: currentLight = .red
        case .yellow: currentLight = .green
        }
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .pink]),
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 18) {
                    CircleView(color: .red, opacity: currentLight == .red ? 1 : 0.3)
                    CircleView(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                    CircleView(color: .green, opacity: currentLight == .green ? 1 : 0.3)
                }
                .padding()
                
                Spacer()
                
                ButtonView(title: buttonTitle) {
                    if buttonTitle == "START" {
                        buttonTitle = "NEXT"
                    }
                    nextColor()
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
