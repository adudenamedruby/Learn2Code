//
//  ContentView.swift
//  Challenge1
//
//  Created by Roux Buciu on 2022-07-26.
//

import SwiftUI

struct ContentView: View {
    enum TemperatureType: String {
        case celsius = "Celsius"
        case farenheight = "Farenheight"
        case kelvin = "Kelvin"
    }

    @State private var fromType: TemperatureType = .celsius
    @State private var toType: TemperatureType = .farenheight
    @State private var inputTemperature: Double = 0.0

    @FocusState private var valueIsFocused: Bool

    var output: Double {
        return 0
    }

    let temperatureTypes: [TemperatureType] = [
        .celsius,
        .farenheight,
        .kelvin
    ]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("From", selection: $fromType) {
                        ForEach(temperatureTypes, id: \.self) {
                            Text($0.rawValue)
                        }
                    }

                    Picker("To", selection: $toType) {
                        ForEach(temperatureTypes, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }

                Section {
                    TextField("Value",
                              value: $inputTemperature,
                              format: .number)
                    .keyboardType(.decimalPad)
                    .focused($valueIsFocused)
                }

                Section {
                    Text("\(convert())")
                } header: {
                    Text("Converted temperature")
                }
            }
            .navigationTitle("TempConvert")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        valueIsFocused = false
                    }
                }
            }
        }
    }

    func convert() -> Measurement<UnitTemperature> {
        var fromUnit: UnitTemperature

        switch fromType {
        case .celsius:
            fromUnit = UnitTemperature.celsius
        case .farenheight:
            fromUnit = UnitTemperature.fahrenheit
        case .kelvin:
            fromUnit = UnitTemperature.kelvin
        }

        var toUnit: UnitTemperature
        switch toType {
        case .celsius:
            toUnit = UnitTemperature.celsius
        case .farenheight:
            toUnit = UnitTemperature.fahrenheit
        case .kelvin:
            toUnit = UnitTemperature.kelvin
        }

        let temp = Measurement(value: inputTemperature, unit: fromUnit)

        let test = temp.converted(to: toUnit)

        return test
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
