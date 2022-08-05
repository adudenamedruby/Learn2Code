//
//  TDDCaseStudyTests.swift
//  TDDCaseStudyTests
//
//  Created by Roux Buciu on 2022-08-05.
//
//

import XCTest
@testable import TDDCaseStudy

class TDDCaseStudyTests: XCTestCase {

    func testLoadingImages() {
        let sut = ViewController()

        sut.loadViewIfNeeded()

        XCTAssertEqual(sut.pictures.count, 10, "There should be 10 picture")
    }

    func testTableExists() {
        let sut = ViewController()

        sut.loadViewIfNeeded()

        XCTAssertNotNil(sut.tableView)
    }

    func testTableViewHasCorrectRowCount() {
        let sut = ViewController()

        sut.loadViewIfNeeded()

        let rowCount = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, sut.pictures.count)
    }

    func testEachCellHasTheCorrectText() {
        let sut = ViewController()

        sut.loadViewIfNeeded()

        for (index, picture) in sut.pictures.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)

            XCTAssertEqual(cell.textLabel?.text, picture)
        }
    }

    func testCellsHaveDisclosureIndicators() {
        let sut = ViewController()

        sut.loadViewIfNeeded()

        for index in sut.pictures.indices {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)

            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }

    func testViewControllerUsesLargeTitles() {
        let sut = ViewController()
        _ = UINavigationController(rootViewController: sut)

        sut.loadViewIfNeeded()

        XCTAssertTrue(sut.navigationController?.navigationBar.prefersLargeTitles ?? false)
    }

    func testNavigationBarHasStormViewerTitle() {
        let sut = ViewController()

        sut.loadViewIfNeeded()

        XCTAssertEqual(sut.title, "Storm Viewer")
    }
}
