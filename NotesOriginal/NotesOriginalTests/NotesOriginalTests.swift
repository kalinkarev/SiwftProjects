//
//  NotesOriginalTests.swift
//  NotesOriginalTests
//
//  Created by Kalin Karev on 2/1/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import XCTest
// testing framework

@testable import NotesOriginal
// testable attribute -> gives your tests access to the internal elements of your app's code

// Tests the functionality and performance of the app
// Test cases are simply methods that the system automatically runs as part ofyour init tests

class NotesOriginalTests: XCTestCase {
    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

    // write a unit test for Note object initialization
    
    // MARK: Note Class Tests
    
    // Confirm that the Note initializer returns a Note object when passed valid parameters.
    
    func testNoteInitializationSucceeds() {
        // Name
        let noteWithName = Note.init(name: "Work")
        XCTAssertNotNil(noteWithName)  // check that the returned Note object is not nil
    }
    
    // Confirm that the Note initializer returns nil when passed an empty name.
    func testNoteInitializationFails() {
        // Empty String
        let emptyStringNote = Note.init(name: "Test")
        XCTAssertNotNil(emptyStringNote)
    }
    
    
}
