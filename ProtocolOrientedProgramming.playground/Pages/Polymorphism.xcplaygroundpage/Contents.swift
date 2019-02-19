import UIKit
import Foundation

/*
 The idea behing protocol polymorphism is that you can create a general protocol that later you can derivate into specific behavior. All the classes that implemented this protocol can be threated as a single class.
 
 For example:
                Shape                   -> this is the GENERAL ATTRIBUTE
 Square  Circle  Rhombus   Rectangle    -> This are the classes that will adopt the general protocol
 
 -> Then you can agrupate everythin as one type
 let arrayOfShapes = [square, circle, rhombus, rectangle]
 
 */


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
