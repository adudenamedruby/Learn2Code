//
//  DownloadimageAsync.swift
//  SwiftConcurrencyBootcamp
//
//  Created by roux buciu on 2022-07-10.
//

import SwiftUI

class DownloadImageAsyncImageLoader {

    let url = URL(string: "https://picsum.photos/200")!

    func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
            guard let data = data,
                  let image = UIImage(data: data),
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300
            else { return nil }

        return image
    }

    func downloadWithEscaping(completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
//    func downloadWithEscaping(completion: @escaping (Result<UIImage, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300
            else {
                completion(nil, nil)
                return
            }

            guard let data = data,
                  let image = UIImage(data: data)
            else {
                completion(nil, nil)
                return
            }

            completion(image, error)
        }.resume()
    }

    func downloadWithAsync() async throws -> UIImage {
        do {
            let (data, response) = try await URLSession.shared.data(from: url, delegate: nil)

            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300
            else { throw URLError(.badServerResponse) }

            guard let image = UIImage(data: data) else { throw URLError(.cannotDecodeRawData) }

            return image
        } catch {
            throw error
        }
    }
}

class DownloadImageAsyncVM: ObservableObject {

    @Published var image: UIImage? = nil
    let loader = DownloadImageAsyncImageLoader()

    func fetchImage() async {
//        loader.downloadWithEscaping { [weak self] image, error in
//            DispatchQueue.main.async {
//                self?.image = image
//            }
//        }

        let image = try? await loader.downloadWithAsync()
        await MainActor.run {
            self.image = image
        }
    }
}

struct DownloadimageAsync: View {

    @StateObject private var viewModel = DownloadImageAsyncVM()

    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchImage()
            }
        }
    }
}

struct DownloadimageAsync_Previews: PreviewProvider {
    static var previews: some View {
        DownloadimageAsync()
    }
}
