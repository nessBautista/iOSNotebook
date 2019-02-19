//: [Previous](@previous)

import Foundation
import UIKit
/*
 The basic idea is to show how to use the protocols.
 First, a protocol is declared of course the protocol is only a blue print.
 You need to describe its behavior, weather in an extension (defaul behavior)
 Or in the class that is adopting the protocol.
 We start by defining 2 protocols with default behavior:
 
 ////----> DEFINE PROTOCOLS
 protocol Animatable {
    //.... Properties are declared here
 }
 extension Animatable where Self:View {
    //...The default behavior is declared in an extension
 }
 protocol Borderable {
    //.... Properties are declared here
 }
 extension Borderable where Self: UIView {
    //...The default behavior is declared in an extension
 }
 
 ////----> ADOPT PROTOCOLS
 class MyView: UIView, Animatable, Borderable {
 }
 
 ////----> USE PROTOCOLS
 That's it, you can use it. Notice that you didn't have to declare anything in the class, because of the default behavior provided in extensions.
 */


////----> DEFINE PROTOCOLS
protocol Animatable {
    var test:Int {get set}
    func pulse(duration: TimeInterval)
    
    init(test:Int, frame: CGRect)
}

extension Animatable where Self: UIView {
    init(test:Int, frame:CGRect){
        self.init(frame: frame)
        self.test = test
    }
    
    func pulse(duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
            print("animating")
        }, completion: {_ in
            UIView.animate(withDuration: duration/2, animations: {
                self.alpha = 1
                self.backgroundColor = .green
                print("finishing animating")
            })
        })
    }
}

protocol Borderable {
    var cornerRadius: CGFloat { get }
    var borderWidth: CGFloat { get }
}

extension Borderable where Self: UIView {
    var cornerRadius: CGFloat {
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
    var borderWidth: CGFloat{
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
}

////----> ADOPT PROTOCOLS
class MyView: UIView, Animatable, Borderable {
    var test = 0 // is required to declare the variable test
}

////----> USE PROTOCOLS
var myView = MyView(test:0, frame: CGRect(x: 0, y: 0, width: 100, height: 100))
myView.backgroundColor = .red
myView.cornerRadius = 10
myView.borderWidth = 1
myView.pulse(duration: 1.5)
