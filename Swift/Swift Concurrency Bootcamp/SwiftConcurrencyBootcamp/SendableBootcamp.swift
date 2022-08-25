//
//  SendableBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by roux buciu on 2022-07-24.
//

import SwiftUI

/*
 Sendable is about sending an non-thread safe object (like a class) into an actor

 Note that objects in the Stack are Sendable by default. Only things in the heap need
 to conform to Sendable
*/


actor CurrentUserManager {

    func updateDatabase(userInfo: MyClassUserInfo) {

    }
}

struct MyUserInfo {
    // Because structs mutate by copying value, variables don't send a compiler error
    let name: String
    var occupation: String
}

// no other class should be able to inherit from this class if this
// inherits from `Sendable`.
//
// `@unchecked` is basically a `!`. You're overriding the compiler and telling it that
// you will check variables yourself. This is DANGEROUS
final class MyClassUserInfo: @unchecked Sendable {
    // Constants are actually sendable because tehy're not gonna change
    let name: String
    // Variables DO send warnings, because they mutate the class
    // In other words, when we send this class into the actor, there may be another
    // reference to this class, that's not in the actor, that's changing this class
    // in a non-thread safe way
    private var occupation: String

    // We have to basically go back, kate, and create queues to make certain things
    // like the variable, thread safe.
    let queue = DispatchQueue(label: "hoooheeeehaaaaa")

    init(name: String, occupation: String) {
        self.name = name
        self.occupation = occupation
    }

    func updateOccupation(to occupation: String) {
        queue.async {
            self.occupation = occupation
        }
    }
}

class SendableBootcampViewModel: ObservableObject {

    let manager = CurrentUserManager()

    func updateCurrentUserInfo() async {
        // No warnings here becasue the Struct is Sendable
//        let info = MyUserInfo(name: "User Info")

        // If the class conforms to sendable, then we'll get warnings
        let info = MyClassUserInfo(name: "Hello", occupation: "boop")

        await manager.updateDatabase(userInfo: info)
    }
}

struct SendableBootcamp: View {
    @StateObject private var viewModel = SendableBootcampViewModel()
    var body: some View {
        Text("Hi")
            .task {
                await viewModel.updateCurrentUserInfo()
            }
    }
}

struct SendableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SendableBootcamp()
    }
}
