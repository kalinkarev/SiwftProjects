//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Kalin Karev on 1/10/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: Meal Class Tests
    
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testMealinitializationSucceeds() {
        // No name
        let noName = Meal.init(name: "No")
        XCTAssertNotNil(noName)
        
        // Name
        let name = Meal.init(name: "Kalin")
        XCTAssertNotNil(name)
    }
    
    // Confirm that the Meal initializer returns nil passed empty string for name
//    func testMealInitializationFail() {
//        let failName = Meal.init(name: "")
//        XCTAssertNotNil(failName)
//    }
    
}
