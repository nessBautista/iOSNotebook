import UIKit
import Foundation
//--------- PROTOCOL ANATOMY
protocol BinaryRepresentable /* :AnyObject */ {
    //the AnyObject forces to this protocol to be implemented by classes only
    
    var tag: String {get set}       //<--- Only vars can be defined.
    var data: Data {get }           //<--- If you need a let, use a 'get' only
    static var counter:Int {get}    //<--- available to all instances
    
    //if we defined a requirement for a method that modifies the instance
    //its recommended to mark it with the keyword 'mutating'
    //the mutating keyword allows to the value types also adopt the protocol
    //value types(structs, enums, tuples)
    mutating func update(data:Data)-> Bool  //<--- accepts methods
    static func incrementCounter()          //<--- static methods can be accesed from any instance

    init(tag: String, data: Data)   //<--- Allows initializer
}

struct TaggedData: BinaryRepresentable {
    var tag: String
    
    var data: Data
    
    static var counter: Int = 0
    
    func update(data: Data) -> Bool {
        return true
    }
    
    static func incrementCounter() {
        TaggedData.counter += 1
    }
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}


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
    func pulse(duration: TimeInterval)
}
extension Animatable where Self: UIView {
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
    
}
var myView = MyView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
myView.backgroundColor = .red
myView.cornerRadius = 10
myView.borderWidth = 1
myView.pulse(duration: 1.5)
