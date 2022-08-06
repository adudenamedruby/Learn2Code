//
// Created by Roux Buciu on 2022-08-05.
// Copyright (c) 2022 Ray Wenderlich. All rights reserved.
//

import XCTest

@testable import FitNess

class StepCountControllerTests: XCTestCase {

    var sut: StepCountController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = StepCountController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testController_whenStartTapped_appIsInProgress() {
        sut.startStopPause(nil)

        let state = AppModel.instance.appState
        XCTAssertEqual(state, AppState.inProgress)
    }
}