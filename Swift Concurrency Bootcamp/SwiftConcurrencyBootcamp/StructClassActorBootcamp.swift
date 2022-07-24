//
//  StructClassActorBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Roux Buciu on 2022-07-18.
//

import SwiftUI

struct StructClassActorBootcamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                runTest()
            }
    }
}

struct StructClassActorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StructClassActorBootcamp()
    }
}

struct MyStruct {
    var title: String
}

class MyClass {
    var title: String

    init(title: String) {
        self.title = title
    }
}

extension StructClassActorBootcamp {

    private func runTest() {
        print("""
Test Started

""")

//        structTest1()
//        printDivider()
//        classTest1()

        structTest2()
        printDivider()
        classTest2()
    }

    private func printDivider() {
        print("""

--------------------------------------

""")
    }

    private func structTest1() {
        print("structTest1")
        let objectA = MyStruct(title: "Starting title")
        print("ObjectA: ", objectA.title)

        print("Pass the VALUES of objectA to objectB")
        var objectB = objectA
        print("ObjectB: ", objectB.title)

        // This mutation actually creates a totally new struct!
        objectB.title = "Second title"
        print("OBjectB title changed")

        // ObjA & ObjB are pointing to DIFFERENT places in memory
        print("ObjectA: ", objectA.title)
        print("ObjectB: ", objectB.title)
    }

    private func classTest1() {
        print("classTest1")
        let objectA = MyClass(title: "Starting title")
        print("ObjectA: ", objectA.title)

        print("Pass the REFERENCE of objectA to objectB")
        // There is NO need to change this into a variable
        let objectB = objectA
        print("ObjectB: ", objectB.title)

        // Here, we're change the title property INSIDE the object
        objectB.title = "Second title"
        print("OBjectB title changed")

        // ObjA & ObjB are pointing to the SAME place in memory
        print("ObjectA: ", objectA.title)
        print("ObjectB: ", objectB.title)
    }
}

// Immutable!
struct CustomStruct {
    let title: String

    func updateTitle(to newTitle: String) -> CustomStruct {
        return CustomStruct(title: newTitle)
    }
}

// This allows us to control how struct data is manipulated
struct MutatingStruct {
    private(set) var title: String

//    init(title: String) {
//        self.title = title
//    }

    // Mutating here means, change the value of the entire object, not just the property
    mutating func updateTitle(to newTitle: String) {
        self.title = newTitle
    }
}

extension StructClassActorBootcamp {

    private func structTest2() {
        print("structTest2")
        // Mutating vs creating a totally separate struct is basically the same thing
        var struct1 = MyStruct(title: "Title1")
        print("Struct1: ", struct1.title)
        struct1.title = "Title2"
        print("Struct1: ", struct1.title)

        var struct2 = CustomStruct(title: "Title1")
        print("Struct2: ", struct2.title)
        struct2 = CustomStruct(title: "Title2")
        print("Struct2: ", struct2.title)

        var struct3 = CustomStruct(title: "Title1")
        print("Struct3: ", struct3.title)
        struct3 = struct3.updateTitle(to: "Title2")
        print("Struct3: ", struct3.title)

        var struct4 = MutatingStruct(title: "Title1")
        print("Struct4: ", struct4.title)
        struct4.updateTitle(to: "Title2")
        print("Struct4: ", struct4.title)
    }
}

class MyClass2 {
    private(set) var title: String

    init(title: String) {
        self.title = title
    }

    func updateTitle(to newTitle: String) {
        title = newTitle
    }
}
extension StructClassActorBootcamp {

    private func classTest2() {
        print("classTest2")
        // First difference: class is a `let` constant
        // REFERENCEs change the value of the `title` property, rather than the whole object
        let class1 = MyClass(title: "Title1")
        print("Class1: ", class1.title)
        class1.title = "Title2"
        print("Class2: ", class1.title)

        let class2 = MyClass2(title: "Title1")
        print("Class2: ", class2.title)
        class2.updateTitle(to: "Title2")
        print("Class2: ", class2.title)
    }

    /*
     So Reference vs Value is really Stack vs Heap

     Stack is static memory allocation, and Heap is dynamic memory allocation

     Access to Stack is very fast. Stack is reserved LIFO order for callers, and done at
     compile time.

     Access to Heap is slower. Heap is allocated at run time, and its limited by size of
     virtual memory. Heap elements have no dependencies and can be accessed randomly in
     any order at any time, which makes it complex to keep track of. Hence, the slowness.

     BIG DIFFERENCE in Multi-threaded environments:
     Each thread has its own Reginsters & Stack.
     But all threads share the same Heap! Which is where multi-threading issues come into
     play, because it has to synchronize between all the threads. So the pointers can
     be on separate threads, but the thing being pointed to, is not.

     ARC is only used on REFERENCE type. ARC is only for objects in the heap.
     */
}

actor MyActor {
    private(set) var title: String

    init(title: String) {
        self.title = title
    }

    func updateTitle(to newTitle: String) {
        title = newTitle
    }
}
extension StructClassActorBootcamp {
    /*
     What are Actors? More or less the same thing as classes, except that they
     are thread safe.

     Both classes & Actors are stored on the heap. If two thread access the Actor,
     one of them is going to have to await for the other thread to finish it's process
     */

    private func actorTest1() {
        // The error "Actor-isolated property 'title' can not be referenced from
        // a non-isolated context" will pop up if just using a regular func. We
        // have to be in an async environment, either using an async function or
        // using a Task
        Task {
        print("actorTest1")
            let objectA = MyActor(title: "Starting title")
            await print("ObjectA: ", objectA.title)

            print("Pass the REFERENCE of objectA to objectB")
            let objectB = objectA
            await print("ObjectB: ", objectB.title)

            // we can't just change the value from outside the actor itself
            await objectB.updateTitle(to: "Second title")
            print("OBjectB title changed")

            // ObjA & ObjB are pointing to the SAME place in memory
            await print("ObjectA: ", objectA.title)
            await print("ObjectB: ", objectB.title)
        }
    }
}

/*
 General comments:

 Structs: data models, views (in SwiftUI)
 Classes: classes as view models (in SwiftUI, confrom a class to `ObservableObject` to get `@Published` variables
 Actors: good for manager classes and such. Basically, anywhere that a class might be accessed by multiple threads at the same time.
 */
