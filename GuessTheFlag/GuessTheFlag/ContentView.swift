//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Алексей on 21.01.2020.
//  Copyright © 2020 Алексей. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
//            Color(red: 1, green: 0.8, blue: 0.6).edgesIgnoringSafeArea(.bottom)
//            LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .top, endPoint: .bottom)
//            RadialGradient(gradient: Gradient(colors: [.orange, .blue]), center: .center, startRadius: 5, endRadius: 90)
            AngularGradient(gradient: Gradient(colors: [.red, .orange, .blue, .green, .pink, .purple]), center: .center)
            VStack {
                Button("Show alert") {
                    self.showingAlert = true
                }
                .accentColor(.white)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Hello it's alert"), message: Text("Some describtion here"), dismissButton: .default(Text("OK")))
                }
                Text("Hello Alex").colorScheme(.dark)
                Button(action: {
                    print("Button tapped")
                }) {
                    HStack {
                        Image(systemName: "pencil")
                        Text("Edit")
                    }
                    .background(Color.black)
                    .cornerRadius(10.0)
                }.accentColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
