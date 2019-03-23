//
//  String+HelpersTests.swift
//  Currency ConvertTests
//
//  Created by Daniel Teodoro on 23/03/19.
//  Copyright © 2019 Daniel Teodoro. All rights reserved.
//

import XCTest
@testable import Currency_Convert

class String_HelpersTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDoubleString() {
        let double = 2.00
        let doubleString: String = String().doubleString(double)
        
        XCTAssertEqual(doubleString, "$2.00")
    }

    func testDoubleValue() {
        var doubleString = "$2.00"
        let double = doubleString.doubleValue()
        XCTAssertEqual(double, 2.00)
    }


}
