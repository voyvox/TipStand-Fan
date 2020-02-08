//
//  tipstand_fanTests.swift
//  tipstand-fanTests
//
//  Created by Craig Newcomb on 10/24/19.
//  Copyright © 2019 Craig Newcomb. All rights reserved.
//

import XCTest
@testable import tipstand_fan

class tipstand_fanTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testHyphenatedStringOneWord() {
        let string = "testing"
        let stringExpected = "testing"
        
        XCTAssertEqual(string.hyphenated(), stringExpected)
    }
    
    func testHyphenatedStringEmpty() {
        let string = ""
        let stringExpected = ""
        
        XCTAssertEqual(string.hyphenated(), stringExpected)
    }
    
    func testHyphenatedStringTwoWords() {
        let string = "testing this"
        let stringExpected = "testing-this"
        
        XCTAssertEqual(string.hyphenated(), stringExpected)
    }
    
    func testHyphenatedStringMultipleWords() {
        let string = "my name is craig newcomb"
        let stringExpected = "my-name-is-craig-newcomb"
        
        XCTAssertEqual(string.hyphenated(), stringExpected)
    }

}
