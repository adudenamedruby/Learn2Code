//
//  ContinuationBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by roux buciu on 2022-07-12.
//

import SwiftUI

private let url = "https://picsum.photos/300"

class ContinuationBootcampNetworkManager {

    func getData(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw error
        }
    }

    func getDataFromNonAsync(url: URL) async throws -> Data {
        // Unsafe continuations are the equivalent of `!`. You're guaranteeing the
        // compiler that you know what you're doing. You probably don't. So use
        // checked continuations.
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                // YOU MUST CALL `.resume` EXACTLY ONCE!
                if let data = data {
                    continuation.resume(returning: data)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }.resume()
        }
    }

    func getHeartImageFromDatabase(_ completion: @escaping (_ image: UIImage) -> Void) {
        // Don't use dispatch queue with async usually... but for this example it's fine.
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completion(UIImage(systemName: "heart.fill")!)
        }
    }

    func getHeartImageFromDatabase() async -> UIImage {
        return await withCheckedContinuation({ continuation in
            getHeartImageFromDatabase { image in
                continuation.resume(returning: image)
            }
        })
    }
}

class ContinuationBootcampViewModel: ObservableObject {

    let manager = ContinuationBootcampNetworkManager()
    @Published var image: UIImage? = nil

    func getImage() async {
        guard let url = URL(string: url) else { return }

        do {
            let data = try await manager.getDataFromNonAsync(url: url)
            if let image = UIImage(data: data) {
                await MainActor.run(body: {
                    self.image = image
                })
            }

        } catch {
            print(error)
        }
    }

    func getHeartImage() async {
        let image = await manager.getHeartImageFromDatabase()
        self.image = image
    }
}

struct ContinuationBootcamp: View {

    @StateObject private var viewModel = ContinuationBootcampViewModel()

    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
//            await viewModel.getImage()
            await viewModel.getHeartImage()
        }
    }
}

struct ContinuationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContinuationBootcamp()
    }
}
