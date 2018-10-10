//
//  NoteTrackerTests.swift
//  NoteTrackerTests
//
//  Created by Kalin Karev on 1/12/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import XCTest
@testable import NoteTracker

class NoteTrackerTests: XCTestCase {
    
    // MARK: Note Class Tests
    
    // Confirm that the Note initializer returns a Note object when passed valid parameters.
    func testNoteInitializationSucceeds() {
        let note = Note.init(name: "Kalin")
        XCTAssertNotNil(note)
        
        let validNote = Note.init(name: "Svetlin")
        XCTAssertNotNil(validNote)
    }
    
    // Confirm that the Note initializer returns nil when passed an empty name.
    func testNoteInitializationFails() {
        
        // Empty String
        let emptyStringNote = Note.init(name: " ")
        XCTAssertNotNil(emptyStringNote)
        
    }
    
}
