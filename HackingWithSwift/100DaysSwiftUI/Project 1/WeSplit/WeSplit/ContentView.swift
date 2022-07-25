//
//  ContentView.swift
//  WeSplit
//
//  Created by Roux Buciu on 2022-03-11.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var currentStudent = ""

    var body: some View {
        Text("hello wordz")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
