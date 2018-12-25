//
//  MusicTests.swift
//  MyUnitTestAppTests
//
//  Created by Nestor Hernandez on 12/12/18.
//  Copyright © 2018 Nestor Hernandez. All rights reserved.
//

import XCTest
@testable import MyUnitTestApp

class MusicTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseJSON() {
        let music = Music()
        let bundle = Bundle(for: type(of:self))
        if let path = bundle.path(forResource: "JSON", ofType: "txt") {
            if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
                let result = music.parseJson(data: data)
                
                XCTAssertNotNil(result!, "should not be nil")
                XCTAssertGreaterThan(result!.count, 0, "should have values")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }

    func testRefresh() {
        let music = MockMusic()
        music.refresh()
        XCTAssertNotNil(music.cache, "The cache should not be nil")
        
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
