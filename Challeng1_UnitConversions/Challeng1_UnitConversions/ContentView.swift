//
//  ContentView.swift
//  Challeng1_UnitConversions
//
//  Created by Jacob Case on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    @State private var fahrenheit = 0.0
    @State private var unit = "Celcius"
    let converters = ["Celcius", "Kelvin"]
    
    let fahrTokel = 255.9278
    
    var calculateCelcius: Double {
        let celcius = (fahrenheit - 32)/(1.8)
        return celcius
    }
    
    var calculateKelvin: Double {
        let kelvin = calculateCelcius + 273.15
        return kelvin
    }
    
    
    var body: some View {
        Form {
            Section {
                TextField("Input Value", value: $fahrenheit, format: .number) .keyboardType(.decimalPad)
            } header: {
                Text("Fahrenheit:")
            }
            
            Section {
                Picker("Convert", selection: $unit) {
                    ForEach(converters, id: \.self) {
                        Text($0).tag((converters))
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Convert to:")
            }
            
            Section {
                if (unit == "Celcius") {
                Text(calculateCelcius, format: .number)
                } else {
                    Text(calculateKelvin, format: .number)
                }
            } header: {
                Text("\(unit)")
            }
        }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
