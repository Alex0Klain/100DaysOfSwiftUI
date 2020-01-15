//
//  ContentView.swift
//  WeSplit
//
//  Created by Алексей on 14.01.2020.
//  Copyright © 2020 Алексей. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
//    @State private var tapCount = 0
//    @State private var name = ""
    
    var body: some View {
        
//        NavigationView {
//            Form {
//                Section {
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                }
//                Section {
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                }
//            }.navigationBarTitle("SwiftUI")
                
//        Button("Tap count: \(tapCount)") {
//            self.tapCount += 1
//        }
        
//        Form {
//            TextField("Enter your name", text: $name)
//            Text("Your name is \(name)")
//        }
            
//        }
//        Form {
//            ForEach(0 ..< 100) {
//                Text("Row \($0)")
//            }
//        }
        
        VStack {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose: Student # \(students[selectedStudent])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
