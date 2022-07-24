//
//  DoCatchTryThrowsBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by roux buciu on 2022-07-10.
//

import SwiftUI

class DoTryCatchThrowsBootcampDataManager {

    let isActive: Bool = false

    func getTitle() -> (title: String?, error: Error?) {

        if isActive {
            return ("New Text", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }

    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("New Text!")
        } else {
            return .failure(URLError(.badURL))
        }
    }

    func getTitle3() throws -> String {
        if isActive {
            return "NewText"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

class DoTryCatchThrowsBootcampVM: ObservableObject {

    @Published var text: String = "Starting text."
    let manager = DoTryCatchThrowsBootcampDataManager()

    func fetchTitle() {
//        let returnedValue = manager.getTitle()
//
//        if let newTitle = returnedValue.title {
//            self.text = newTitle
//        } else if let error = returnedValue.error {
//            self.text = error.localizedDescription
//        }

//        let result = manager.getTitle2()
//        switch result {
//        case .success(let newTitle):
//            self.text = newTitle
//        case .failure(let error):
//            self.text = error.localizedDescription
//        }

        do {
            let newTitle = try manager.getTitle3()
            self.text = newTitle
        } catch let error {
            self.text = error.localizedDescription
        }
    }
}

struct DoCatchTryThrowsBootcamp: View {

    @StateObject private var viewModel = DoTryCatchThrowsBootcampVM()

    var body: some View {
        Text(viewModel.text)
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .onTapGesture {
                viewModel.fetchTitle()
            }
    }
}

struct DoCatchTryThrowsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DoCatchTryThrowsBootcamp()
    }
}
