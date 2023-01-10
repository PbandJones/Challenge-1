//
//  ContentView.swift
//  Challenge1
//
//  Created by Family Computer on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0.0
    @State private var inputUnit = "Seconds"
    @State private var outputUnit = "Days"
    @FocusState private var amountIsFocused: Bool
    
    let units = ["Seconds", "Minutes", "Hours", "Days"]
    
    var result: String {
        let inputToSecondsMultiplier: Double
        let secondsToOutputDivider: Double
        
        switch inputUnit {
        case "Minutes":
            inputToSecondsMultiplier = 60
        case "Hours":
            inputToSecondsMultiplier = 3600
        case "Days":
            inputToSecondsMultiplier = 86400
        default:
            inputToSecondsMultiplier = 1.0
        }
        
        switch outputUnit {
        case "Minutes":
            secondsToOutputDivider = 60
        case "Hours":
            secondsToOutputDivider = 3600
        case "Days":
            secondsToOutputDivider = 86400
        default:
            secondsToOutputDivider = 1.0
        }
        
        let inputInSeconds = inputNumber * inputToSecondsMultiplier
        let output = inputInSeconds / secondsToOutputDivider
        
        let outputString = output.formatted()
        return "\(outputString) \(outputUnit.lowercased())"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Number", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Number to Convert")
                }
                Picker("Convert from:", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                Picker("Convert to:", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                Section {
                    Text("\(result)")
                } header: {
                    Text("Result")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
