import UIKit
import Foundation




//---------POLYMORPHISM
protocol Shape {
    var area: Double {get}
}

struct Square: Shape {
    let side: Double
    
    var area: Double {
        return side * side
    }
}

struct Rectangle: Shape {
    let width: Double
    let height: Double
    
    var area: Double {
        return width * height
    }
}

struct Rhombus: Shape {
    let d1: Double
    let d2: Double
    
    var area: Double {
        return (d1 * d2) / 2
    }
}

struct Circle: Shape {
    let radius: Double
    
    var area: Double {
        return .pi * (radius * radius)
    }
}

//We can't instantiate the shape protocol directly
//yet we can take advantage of the polymorphic behavior
var shape: Shape = Rectangle(width: 10, height: 20)
print(shape.area)

shape = Circle(radius: 100)
print(shape.area)

shape = Rhombus(d1: 20, d2: 50)
print(shape.area)


var shapes = [Shape]()
let square = Square(side:50)
let rectangle = Rectangle(width: 20, height: 100)
let circle = Circle(radius: 400)
shapes.append(square)
shapes.append(rectangle)
shapes.append(circle)

for shape in shapes {
    print("area from array: \(shape.area)"  )
}

//---------EXAMPLE
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

//Adopt the protocols
class MyView: UIView, Animatable, Borderable {
    var test: Int = 0
    
//    var test: Int = 0
//    required init(test: Int, frame:CGRect) {
//        super.init(frame: frame)
//        self.test = 0
//    }
    
    
}
var myView = MyView(test:0, frame: CGRect(x: 0, y: 0, width: 100, height: 100))
myView.backgroundColor = .red
myView.cornerRadius = 10
myView.borderWidth = 1
myView.pulse(duration: 1.5)
