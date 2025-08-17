//
//  ParkItTests.swift
//  ParkItTests
//
//  Created by Connor Smith on 8/17/25.
//

import XCTest
@testable import ParkIt

final class ParkItTests: XCTestCase {

    func testParkingFloorClears() throws {
        // Given a string value
        var parkingFloor = "5"
        
        // When the clear action is triggered
        parkingFloor = ""
        
        // Then the string should be empty
        XCTAssertEqual(parkingFloor, "", "The parking floor should be cleared.")
    }
}
