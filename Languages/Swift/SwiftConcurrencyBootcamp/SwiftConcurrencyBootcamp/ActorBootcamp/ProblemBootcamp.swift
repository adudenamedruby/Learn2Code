//
//  ActorBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by roux buciu on 2022-07-23.
//

import SwiftUI

/*
 1. What is the problem that actors are solving
    A data race problem, when two objects are accessing the same pointer
 */

class MyDataManager {

    static let shared = MyDataManager()
    private init() {}

    var data = [String]()

    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)

        return data.randomElement()
    }
}

struct HomeView: View {

    let manager = MyDataManager.shared
    @State private var text = ""
    let timer = Timer
        .publish(
            every: 0.1,
            tolerance: nil,
            on: .main,
            in: .common,
            options: nil)
        .autoconnect()

    var body: some View {
        ZStack {
            Color.gray.opacity(0.8).ignoresSafeArea()
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            DispatchQueue.global(qos: .background).async {
                if let data = manager.getRandomData() {
                    DispatchQueue.main.async {
                        self.text = data
                    }
                }
            }
        }
    }
}

struct BrowseView: View {

    let manager = MyDataManager.shared
    @State private var text = ""
    let timer = Timer
        .publish(
            every: 0.01,
            tolerance: nil,
            on: .main,
            in: .common,
            options: nil)
        .autoconnect()

    var body: some View {
        ZStack {
            Color.yellow.opacity(0.8).ignoresSafeArea()
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            DispatchQueue.global(qos: .default).async {
                if let data = manager.getRandomData() {
                    DispatchQueue.main.async {
                        self.text = data
                    }
                }
            }
        }
    }

}

struct ActorBootcamp: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ActorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActorBootcamp()
    }
}
