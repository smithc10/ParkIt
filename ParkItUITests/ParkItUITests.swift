//
//  ParkItUITests.swift
//  ParkItUITests
//
//  Created by Connor Smith on 8/17/25.
//
import XCTest

final class ParkItUITests: XCTestCase {

    func testParkingFlow() throws {
        let app = XCUIApplication()
        app.launch()

        let parkingTextField = app.textFields["Hi there, what floor did you park on today?"]
        let returnButton = app.buttons["Thanks I've returned to my car"]
        let floorDisplay = app.staticTexts["You parked on floor:"]

        XCTAssertTrue(parkingTextField.exists)
        XCTAssertFalse(returnButton.exists)
        XCTAssertFalse(floorDisplay.exists)
        
        parkingTextField.tap()
        parkingTextField.typeText("5")
        

        XCTAssertTrue(returnButton.waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["5"].exists)
        
        returnButton.tap()
        
        XCTAssertFalse(returnButton.exists)
        XCTAssertFalse(app.staticTexts["5"].exists)
        XCTAssertTrue(parkingTextField.exists)
    }
}

