//
//  ActorBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by roux buciu on 2022-07-23.
//

import SwiftUI

/*
 3. How do Actors solve the problem?
 */

// All the code inside an Actor is ISOLATED
// It basicaly creates an async environment
actor MyDataManager3 {

    static let shared = MyDataManager3()
    private init() {}

    var data = [String]()

    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)

        return data.randomElement()
    }

    // This function exemplifies how to pull an actor element out of isolation
    // IMPORTANT: nonisolated items LOSE access to isolated things and so,
    // you'd have to enter an async environment
    nonisolated func getSavedData() -> String {
        return "NEW DATA!"
    }
}
/*

 IMPORTANT ACTOR STUFF
 1. Actors are created using the `actor` keyword. This is a concrete nominal
 type in Swift, like structs, classes, and enums.

 2. Like classes, actors are reference types. This makes them useful for
 sharing state in your program.

 3. They have many of the same features as classes: you can give them
 properties, methods (async or otherwise), initializers, and subscripts,
 they can conform to protocols, and they can be generic.

 4. Actors do not support inheritance, so they cannot have convenience
 initializers, and do not support either `final` or `override`.

 5. All actors automatically conform to the `Actor` protocol, which no other
 type can use. This allows you to write code restricted to work only
 with actors.

 6. If you’re attempting to read a variable property or call a method on an
 actor, and you’re doing it from outside the actor itself, you must do so
 asynchronously using `await`.

 7. Automatically conform to the AnyObject protocol, and can therefore
 conform to `Identifiable` without adding an explicit id property.

 8. Can have a deinitializer.

 9. Can execute only one method at a time, regardless of how they are
 accessed.

 */

struct HomeView3: View {

    let manager = MyDataManager3.shared
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
        .onAppear(perform: {
            let _ = manager.getSavedData()
        })
        .onReceive(timer) { _ in
            Task {
                if let data = await manager.getRandomData() {
                    await MainActor.run {
                        self.text = data
                    }
                }
            }
        }
    }
}

struct BrowseView3: View {

    let manager = MyDataManager3.shared
    @State private var text = ""
    let timer = Timer.publish(every: 0.01, tolerance: nil, on: .main, in: .common, options: nil).autoconnect()

    var body: some View {
        ZStack {
            Color.yellow.opacity(0.8).ignoresSafeArea()
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            Task {
                if let data = await manager.getRandomData() {
                    await MainActor.run {
                        self.text = data
                    }
                }
            }
        }
    }
}

struct ActorBootcamp3: View {
    var body: some View {
        TabView {
            HomeView3()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            BrowseView3()
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ActorBootcamp3_Previews: PreviewProvider {
    static var previews: some View {
        ActorBootcamp3()
    }
}

func print(from actor: isolated MyDataManager3) {
    print(actor.data)
}
