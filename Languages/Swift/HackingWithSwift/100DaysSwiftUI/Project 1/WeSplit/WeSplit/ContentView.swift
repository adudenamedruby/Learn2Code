//
//  ContentView.swift
//  WeSplit
//
//  Created by Roux Buciu on 2022-03-11.
//

import SwiftUI

struct ContentView: View {
<<<<<<< HEAD
    @State private var chequeAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPrecentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [10, 15, 20, 25, 0]

    var grandTotal: Double {
        let tipSelection = Double(tipPrecentage)

        let tipValue = chequeAmount / 100 * tipSelection
        let grandTotal = chequeAmount + tipValue

        return grandTotal
    }

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPrecentage)

        let tipValue = chequeAmount / 100 * tipSelection
        let grandTotal = chequeAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount",
                              value: $chequeAmount,
                              format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                }

                Section {
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section {
                    Picker("Tip Percentage", selection: $tipPrecentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip to leave")
                }

                Section {
                    Text(grandTotal, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Grand total")
                }

                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Each person owes")
                }


            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
=======
    let students = ["Harry", "Hermione", "Ron"]
    @State private var currentStudent = ""

    var body: some View {
        Text("hello wordz")
            .padding()
>>>>>>> e9536f9d19806c72baa31f92809bbbc4ba599a1d
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
