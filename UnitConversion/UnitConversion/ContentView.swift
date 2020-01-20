//
//  ContentView.swift
//  UnitConversion
//
//  Created by Алексей on 18.01.2020.
//  Copyright © 2020 Алексей. All rights reserved.
//

import SwiftUI

enum Unit: Int {
    case meters = 0, kilometers, feet, yards, miles
    
    func convertToMeters(unit: Unit, value: Double) -> Double? {
        var constant = 1.0
        switch self {
        case .meters:
            constant = 1.0
        case .kilometers:
            constant = 1000
        case .feet:
            constant = 0.3048
        case .yards:
            constant = 0.9144
        case .miles:
            constant = 1609.34
        }
        
        return constant * value
    }
    
    func convert(to: Unit, value: Double) -> Double {
        let valueInMeters = self.convertToMeters(unit: self, value: value) ?? 0
        var constant = 1.0
        switch to {
        case .meters:
            constant = 1.0
        case .kilometers:
            constant = 0.001
        case .feet:
            constant = 3.28084
        case .yards:
            constant = 1.09361
        case .miles:
            constant = 0.000621371
        }
        
        return constant * valueInMeters
    }
}


struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let measures = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var outputValue: Double {
        let number = Double(inputNumber) ?? 0
        let inUnit = Unit(rawValue: inputUnit)!
        let outUnit = Unit(rawValue: outputUnit)!
        
        let result = inUnit.convert(to: outUnit, value: number)
        
        return result
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input value"), content: {
                    TextField("Enter the number", text: $inputNumber)
                    
                    Picker("Select a unit of measurement", selection: $inputUnit) {
                        ForEach(0 ..< measures.count) {
                            Text("\(self.measures[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                })
                
                Section(header: Text("Output value"), content: {
                    Text("\(outputValue, specifier: "%.4f")")
                    
                    Picker("Select a unit for output measurement", selection: $outputUnit) {
                        ForEach(0 ..< measures.count) {
                            Text("\(self.measures[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                })
            }
        .navigationBarTitle("Unit Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
