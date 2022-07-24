//
//  GlobalActorsBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by roux buciu on 2022-07-24.
//

import SwiftUI

// Read the Global actor Apple Docs

@globalActor struct MyFirstGlobalActor {

    // Once this has been declared, we should NOT access `DataManager()` by itself
    static var shared = DataManager()

}

actor DataManager {

    // Just because  a function exists in an Actor doesn't mean that it's async
    // BUT, when we call it, it'll still be marked with `await` because the actor
    // itself is thread safe. Important difference
    func getDataFromDatabase() -> [String] {
        return ["One", "Two", "Three"]
    }
}

// You can, optionally, mark an entire class or struct as being on a global actor
// THen, you can mark things you don't want to be on that actor as either
// being on a separate actor, or, being non-isolated.
//@MainActor
class GlobalActorBootcampViewModel: ObservableObject {

    @MainActor @Published var dataArray = [String]()
    let  manager = MyFirstGlobalActor.shared

    // Marking it this way, isolates this to the global actor
    @MyFirstGlobalActor
    func getData() async {
        let data = await manager.getDataFromDatabase()
        // Normally, stuff that must be  updated on the main thread goes here.
        // However, by marking `dataArray` as `@MainActor`, we making it part of the
        // MainActor global actor, which enables warnings when you're not on the correct
        // actor.
        await MainActor.run(body: {
            self.dataArray = data
        })
    }
}

struct GlobalActorsBootcamp: View {

    @StateObject private var viewModel  = GlobalActorBootcampViewModel()

    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.dataArray, id: \.self)  {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .task {
            await viewModel.getData()
        }
    }
}

struct GlobalActorsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GlobalActorsBootcamp()
    }
}
