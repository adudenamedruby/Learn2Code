//
// Created by Roux Buciu on 2022-08-05.
// Copyright (c) 2022 Ray Wenderlich. All rights reserved.
//

import Foundation
import XCTest
@testable import FitNess

class AppModelTests: XCTestCase {

    func testAppModel_whenInitialized_isInNotStartedState() {
        let sut = AppModel()

        let initialState = sut.appState

        XCTAssertEqual(initialState, AppState.notStarted)
    }

    func testAppModel_whenStarted_isInProgressState() {
        let sut = AppModel()

        sut.start()

        let observedState = sut.appState
        XCTAssertEqual(observedState, AppState.inProgress)
    }
}