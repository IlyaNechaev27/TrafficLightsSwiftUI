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
    @State private var currentColor: ThreeColor = .green
    @State private var onRed: Bool = false
    @State private var onYellow: Bool = false
    @State private var onGreen: Bool = false
    
    @State private var wasPressed = false
    private let offLight: Double = 0.3
    private let onLight: Double = 1
    
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.purple, .pink]),
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all )
            
            VStack {
                
                VStack(spacing: 18) {
                    CircleView(color: .red, alpha: onRed ? onLight : offLight)
                    CircleView(color: .yellow, alpha: onYellow ? onLight : offLight)
                    CircleView(color: .green, alpha: onGreen ? onLight : offLight)
                }
                .padding()
                
                Spacer()
                
                Button (action: {
                    self.wasPressed = true
                    
                    switch self.currentColor {
                    case .red:
                        onRed.toggle()
                        onYellow.toggle()
                        currentColor = .yellow
                    case .green:
                        self.onGreen.toggle()
                        self.onRed.toggle()
                        self.currentColor = .red
                    case .yellow:
                        onYellow.toggle()
                        onGreen.toggle()
                        currentColor = .green
                    }
                }) {
                    wasPressed ? Text("NEXT") : Text("START")
                }
                .font(.system(size: 40, weight: .medium, design: .default).italic())
                .foregroundColor(.black)
                .frame(width: 200, height: 80)
                .background(Color.white)
                .cornerRadius(15)
                .padding()
                
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
