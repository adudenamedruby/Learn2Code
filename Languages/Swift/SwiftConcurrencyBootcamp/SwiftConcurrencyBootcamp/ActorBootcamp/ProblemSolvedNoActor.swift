//
//  ProblemSolvedActor.swift
//  SwiftConcurrencyBootcamp
//
//  Created by roux buciu on 2022-07-23.
//

import SwiftUI

/*
 2. How was this problem solved before?
    Using queues inside the class work. This work... but is kinda dirty.
 */

class MyDataManager2 {

    static let shared = MyDataManager2()
    private init() {}

    var data = [String]()

    private let queue = DispatchQueue(label: "com.MyAppName.MyDataManager2")

    func getRandomData(completion: @escaping (_ title: String?) -> Void) {
        // these queues are sometimes called "locks"
        queue.async {
            self.data.append(UUID().uuidString)
            print(Thread.current)

            completion(self.data.randomElement())
        }
    }
}

struct HomeView2: View {

    let manager = MyDataManager2.shared
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
                manager.getRandomData { title in
                    if let title = title {
                        DispatchQueue.main.async {
                            self.text = title
                        }
                    }
                }
            }
        }
    }
}

struct BrowseView2: View {

    let manager = MyDataManager2.shared
    @State private var text = ""
    let timer = Timer.publish(every: 0.01, tolerance: nil, on: .main, in: .common, options: nil).autoconnect()

    var body: some View {
        ZStack {
            Color.yellow.opacity(0.8).ignoresSafeArea()
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            DispatchQueue.global(qos: .default).async {
                manager.getRandomData { title in
                    if let title = title {
                        DispatchQueue.main.async {
                            self.text = title
                        }
                    }
                }
            }
        }
    }

}

struct ActorBootcamp2: View {
    var body: some View {
        TabView {
            HomeView2()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            BrowseView2()
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ActorBootcamp2_Previews: PreviewProvider {
    static var previews: some View {
        ActorBootcamp()
    }
}
