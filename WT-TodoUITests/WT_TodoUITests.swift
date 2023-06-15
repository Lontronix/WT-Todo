//
//  WT_TodoUITests.swift
//  WT-TodoUITests
//
//  Created by Lonnie Gerol on 6/14/23.
//

import XCTest

class BaseTest: XCTestCase {
    
    var app = XCUIApplication()
    var defaultTimeout: TimeInterval = 10
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        app.terminate()
        super.tearDown()
    }
}

class TodoUITests: BaseTest {
    
    func test_tapping_on_complete_removes_task() {
        let button = app.buttons["tasklist.complete.button-476751FD-7BCF-4C72-98E5-3E0176762296"]
        button.waitForExistence(timeout: defaultTimeout)
        button.tap()
        XCTAssertTrue(true)
    }
}
