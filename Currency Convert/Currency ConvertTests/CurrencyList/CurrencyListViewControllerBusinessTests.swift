//
//  CurrencyListViewControllerBusinessTests.swift
//  Currency ConvertTests
//
//  Created by Daniel Teodoro on 23/03/19.
//  Copyright © 2019 Daniel Teodoro. All rights reserved.
//

import XCTest
@testable import Currency_Convert

class CurrencyListViewControllerBusinessTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() {
        let currencyListBusiness = CurrencyListViewControllerBusiness()
        XCTAssertEqual(currencyListBusiness.baseRate.currency, "CAD")
        XCTAssertEqual(currencyListBusiness.baseRate.value, 1)
    }

}
