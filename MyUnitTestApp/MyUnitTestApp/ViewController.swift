//
//  ViewController.swift
//  MyUnitTestApp
//
//  Created by Nestor Hernandez on 12/12/18.
//  Copyright © 2018 Nestor Hernandez. All rights reserved.
//

import UIKit

class TipCalc {
    var defPerc = 75.00
    
    func calTip(amount:Double, tipPercentage: Double) -> Double {
        return  amount * tipPercentage/100
    }
}

class Music {
    var cache: [[String: Any]]?
    var fetchDate: Date?
    
    func refresh(){
        cache = nil
        fetchDate = nil
        fetchMusic { (newData, error) in
            if newData != nil {
                self.fetchDate  = Date()
            }
        }
    }
    
    func fetchMusic(completion: @escaping([[String:Any]]?, Error?)->Void){
        guard cache == nil else { completion(cache, nil); return}
        
        let dt = URLSession.shared.dataTask(with: URL.init(string: "http://orangevalleycaa.org/api/music")!){
            (data, response, error) in
            completion(self.parseJson(data: data!), error)
        }
        dt.resume()
    }
    
    func parseJson(data: Data) ->[[String:Any]]? {
        cache = try? JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
        return cache
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

