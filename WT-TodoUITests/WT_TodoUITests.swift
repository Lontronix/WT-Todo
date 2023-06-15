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

class TaskListUITests: BaseTest {
    
    func test_tapping_on_complete_removes_task() {
        let taskCells = app.otherElements.matching(identifier: "tasklist.todo.cell")
        XCTAssertEqual(taskCells.count, 3)
        
        let button = app.buttons["tasklist.complete.button-476751FD-7BCF-4C72-98E5-3E0176762296"]
        let _ = button.waitForExistence(timeout: defaultTimeout)
        button.tap()
        
        XCTAssertEqual(taskCells.count, 2)
    }
}

class TaskCreateUITests: BaseTest {
    
    override func setUp() {
        app.launch()
        let showCreateTaskButton = app.buttons["tasklist.create.task.button"]
        let _ = showCreateTaskButton.waitForExistence(timeout: defaultTimeout)
        showCreateTaskButton.tap()
    }
    
    func test_create_button_disabled_when_empty_title() {
        let createTaskButton = app.buttons["create_task.create.button"]
        XCTAssertFalse(createTaskButton.isEnabled)
    }
    
    func test_create_button_enaled_when_nonempty_title() {
        let createTaskButton = app.buttons["create_task.create.button"]
        
        let titleTextField = app.textFields["create_task.title.label"]
        titleTextField.tap()
        titleTextField.typeText("Sample Title")
        
        XCTAssertTrue(createTaskButton.isEnabled)
    }
    
}
