//
//  MyUnitTestAppTests.swift
//  MyUnitTestAppTests
//
//  Created by Nestor Hernandez on 12/12/18.
//  Copyright © 2018 Nestor Hernandez. All rights reserved.
//

import XCTest
@testable import MyUnitTestApp

class MyUnitTestAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTipCalc() {
        let tc = TipCalc()
        let tip = tc.calTip(amount: 128.51, tipPercentage: 50)
        XCTAssertEqual(64.26, tip, accuracy:0.01, "tip was wrong for 50%")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
