//
//  ViewController.swift
//  ShopifyMobile
//
//  Created by Nestor Hernandez on 12/16/18.
//  Copyright © 2018 Nestor Hernandez. All rights reserved.
//

import UIKit
import MobileBuySDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let query = Storefront.buildQuery { $0
            .shop { $0
                .name()
            }
        }
        print(query)
        
    }


}

