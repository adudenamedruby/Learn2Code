//
// Created by Roux Buciu on 2022-08-05.
//

import XCTest
@testable import TDDCaseStudy

struct Test {

}

enum TestTwo {

}

protocol testThree {

}

class DetailsViewControllerTests: XCTestCase {
    typealias LesterBPearsen = UIImage

    let a: testThree

    func testDetailImageViewExists() {
        let sut = DetailViewController()

        sut.loadViewIfNeeded()

        XCTAssertNotNil(sut.imageView)
    }

    func testDetailsViewIsImageView() {
        let sut = DetailViewController()

        sut.loadViewIfNeeded()

        XCTAssertEqual(sut.view, sut.imageView)
    }

    func testDetailLoadsImage() {
        let filenameToTest = "nssl0049.jgp"
        let imageToLoad = UIImage(
            named: filenameToTest,
            in: Bundle.main,
            compatibleWith: nil)

        let sut = DetailViewController()
        sut.selectedImage = filenameToTest

        XCTAssertEqual(sut.imageView.image, imageToLoad)
    }
}
