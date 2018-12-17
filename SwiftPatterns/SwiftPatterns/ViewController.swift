//
//  ViewController.swift
//  SwiftPatterns
//
//  Created by Nestor Hernandez on 12/6/18.
//  Copyright © 2018 Nestor Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                       leading: nil,
                       bottom: nil,
                       trailing: view.safeAreaLayoutGuide.trailingAnchor,
                       padding: .init(top:0, left:0, bottom:0, right:12),
                       size: .init(width:100, height:100))
        
        blueView.anchor(top: redView.bottomAnchor,
                       leading: nil,
                       bottom: nil,
                       trailing: redView.trailingAnchor,
                       padding: .init(top:12, left:0, bottom:0, right:0),
                       size: .init(width:100, height:100))
        
        greenView.anchor(top: redView.topAnchor,
                        leading: view.safeAreaLayoutGuide.leadingAnchor,
                        bottom: blueView.bottomAnchor,
                        trailing: redView.leadingAnchor,
                        padding: .init(top:0, left:12, bottom:0, right:12))
        
    }


}

extension UIView {
    func anchor(top:NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom:NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding:UIEdgeInsets = .zero, size:CGSize = .zero){
        
        //enables autolayout
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant:padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant:padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
