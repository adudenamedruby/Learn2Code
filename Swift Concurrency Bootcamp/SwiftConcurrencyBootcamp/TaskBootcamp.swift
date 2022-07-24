//
//  TaskBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by roux buciu on 2022-07-11.
//

import SwiftUI

class TaskBootcampViewModel: ObservableObject {

    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil

    func fetchImage() async {
//        try? await Task.sleep(nanoseconds: 5_000_000_000)

//        for x in 0...1_000_000_000_000 {
//            print(x)
            // if you need to check for a cancellation mid task. Otherwise,
            // some tasks will just keep going
//            try Task.checkCancellation()
//        }

        do {
            guard let url = URL(string: "https://picsum.photos/1000") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)

            await MainActor.run {
                self.image = UIImage(data: data)
                print("Image returned successdully")
            }

        } catch {
            print(error.localizedDescription)
        }
    }

    func fetchImage2() async {

        do {
            guard let url = URL(string: "https://picsum.photos/1000") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)

            await MainActor.run {
                self.image2 = UIImage(data: data)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct TaskBootcampHomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("click me") {
                    TaskBootcamp()
                }
            }
        }
    }
}

struct TaskBootcamp: View {

    @StateObject private var viewModel = TaskBootcampViewModel()
//    @State private var fetchImageTask: Task<(), Never>? = nil

    var body: some View {
        VStack(spacing: 40) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            if let image = viewModel.image2 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
            // this cancel's automatically if exiting.
            await viewModel.fetchImage()
        }
//        .onAppear {
//            Task {
//                print(Thread.current)
//                print(Task.currentPriority)
//                await viewModel.fetchImage2()
//            }
        //            self.fetchImageTask = Task {
        //                print(Thread.current)
        //                print(Task.currentPriority)
        //                await viewModel.fetchImage()
        //            }

//            Task(priority: .high) {
////                try? await Task.sleep(nanoseconds: 2_000_000_000)
//                await Task.yield()
//                print("low: \(Thread.current) & \(Task.currentPriority)")
//            }
//            Task(priority: .userInitiated) {
//                print("userInitiated: \(Thread.current) & \(Task.currentPriority)")
//            }
//            Task(priority: .medium) {
//                print("medium: \(Thread.current) & \(Task.currentPriority)")
//            }
//            Task(priority: .low) {
//                print("low: \(Thread.current) & \(Task.currentPriority)")
//            }
//            Task(priority: .utility) {
//                print("utility: \(Thread.current) & \(Task.currentPriority)")
//            }
//            Task(priority: .background) {
//                print("background: \(Thread.current) & \(Task.currentPriority)")
//            }

//            Task(priority: .userInitiated) {
//                print("userInitiated: \(Thread.current) & \(Task.currentPriority)")
//
//                // This task inherits the same priority as the parent
//                Task {
//                    print("userInitiated2: \(Thread.current) & \(Task.currentPriority)")
//                }
//
//                // This removes this Task's priority from the parent. Don't do it.
//                Task.detached {
//                    print("detached: \(Thread.current) & \(Task.currentPriority)")
//                }
//            }
//        }
//        .onDisappear {
//            fetchImageTask?.cancel()
//        }
    }
}

struct TaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskBootcamp()
    }
}
