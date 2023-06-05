//
//  TaskGroupBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by roux buciu on 2022-07-12.
//

import SwiftUI

class TaskGroupBootcampDataManager {
    let url = "https://picsum.photos/300"

    func fetchImageWithAsyncLet() async throws -> [UIImage] {
        async let fetchImage1 = await fetchImage(urlString: url)
        async let fetchImage2 = await fetchImage(urlString: url)
        async let fetchImage3 = await fetchImage(urlString: url)
        async let fetchImage4 = await fetchImage(urlString: url)

        let (img1, img2, img3, img4) = await (
            try fetchImage1,
            try fetchImage2,
            try fetchImage3,
            try fetchImage4)

        return [img1, img2, img3, img4]
    }

    func fetchImagesWithTaskGroup() async throws -> [UIImage] {
        let urlStrings = [url, url, url, url]

        return try await withThrowingTaskGroup(of: UIImage.self) { group in
            var images: [UIImage] = []
            // Performance improvement!
            images.reserveCapacity(urlStrings.count)

            // Adding stuff manually....
//            group.addTask { try await self.fetchImage(urlString: self.url) }
//            group.addTask { try await self.fetchImage(urlString: self.url) }
//            group.addTask { try await self.fetchImage(urlString: self.url) }
//            group.addTask { try await self.fetchImage(urlString: self.url) }

            // Or do it in a for loop!
            for urlString in urlStrings {
                // The `try` here means that even if we have 49 successful downloads
                // out of 50, and one fails, then the entire task fails. Making the
                // try optional `try?` allows you to just use the successfully
                // downloaded things, and not throw an error.
                group.addTask { try await self.fetchImage(urlString: urlString) }
            }

            // for await loops wait till we get the task result
            // if the task hangs, we will wait forever!
            for try await image in group {
                images.append(image)
            }

            return images
        }
    }

    func fetchImage(urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch {
            throw error
        }
    }

}

class TaskGroupBootcampViewModel: ObservableObject {

    let manager = TaskGroupBootcampDataManager()
    @Published var images: [UIImage] = []

    func getImages() async {
        if let images = try? await manager.fetchImagesWithTaskGroup() {
            self.images.append(contentsOf: images)
        }
    }
}

struct TaskGroupBootcamp: View {

    @StateObject private var viewModel = TaskGroupBootcampViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("TaskGroups")
            .task {
                await viewModel.getImages()
            }
        }
    }
}

struct TaskGroupBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskGroupBootcamp()
    }
}
