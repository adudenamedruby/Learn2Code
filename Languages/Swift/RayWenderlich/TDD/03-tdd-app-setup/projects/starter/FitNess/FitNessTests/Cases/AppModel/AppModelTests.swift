//
// Created by Roux Buciu on 2022-08-05.
// Copyright (c) 2022 Ray Wenderlich. All rights reserved.
//

import Foundation
import XCTest

@testable import FitNess

class AppModelTests: XCTestCase {

    var sut: AppModel!

    override func setUpWithError() throws {
        try super.setUpWithError()

        sut = AppModel()
    }

    override func tearDownWithError() throws {
        sut = nil

        try super.tearDownWithError()
    }

    func testAppModel_whenInitialized_isInNotStartedState() {
        let initialState = sut.appState

        XCTAssertEqual(initialState, AppState.notStarted)
    }

    func testAppModel_whenStarted_isInProgressState() {
        sut.start()

        let observedState = sut.appState
        XCTAssertEqual(observedState, AppState.inProgress)
    }

    func testAppModel_whenPaused_isPaused() {
        sut.pause()

        let observedState = sut.appState
        XCTAssertEqual(observedState, AppState.paused)
    }
}