//
//  MockMusic.swift
//  MyUnitTestAppTests
//
//  Created by Nestor Hernandez on 12/12/18.
//  Copyright © 2018 Nestor Hernandez. All rights reserved.
//

import Foundation
@testable import MyUnitTestApp

class MockMusic: Music {
    override func fetchMusic(completion: @escaping([[String:Any]]?, Error?) -> Void) {
        let bundle = Bundle(for: type(of:self))
        if let path = bundle.path(forResource: "JSON", ofType: "txt") {
            if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
                let parsedData = self.parseJson(data: data)
                completion(parsedData, nil)
                               
            }
        }
    }
    
    
}
