//: [Previous](@previous)

import Foundation

//--------- PROTOCOL ANATOMY


//The following protocol can be implemented by Classes and Value Types
                             //the AnyObject forces to this protocol to be implemented by classes only
protocol BinaryRepresentable /* :AnyObject */ {
    
    
    var tag: String {get set}       //<--- Only vars can be defined.
    var data: Data {get }           //<--- If you need a let, use a 'get' only
    static var counter:Int {get}    //<--- available to all instances
    
    //if we defined a requirement for a method that modifies the instance
    //its recommended to mark it with the keyword 'mutating'
    //the mutating keyword allows to the value types also adopt the protocol
    //value types(structs, enums, tuples)
    mutating func update(data:Data)-> Bool  //<--- accepts methods
    static func incrementCounter()          //<--- static methods can be accesed from any instance
    init(tag: String, data: Data)           //<--- Allows initializer
}


//The TaggedData struct Value implements the BinaryRepresentable
struct TaggedData: BinaryRepresentable {
    //We need to use the protocol's defined VARIABLES
    var tag: String
    var data: Data
    static var counter: Int = 0
    
    //We need to use the protocol's defined METHODS
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


//The following protocol can be implemented by Classes only
                            //the AnyObject forces to this protocol to be implemented by classes only
protocol ClassDataRepresentable   {
    
    //Defined properties
    var tag: String {get set}
    var data: Data {get }
    
    //Defined methods
    
    //--> Keyword 'mutating' doesn't have any sense now that the protocol is restricted to classes
    /*mutating */func update(data:Data)-> Bool
    init(tag: String, data: Data)
}



class test: ClassDataRepresentable {
    var tag: String
    var data: Data
    
    //TODO: Check why the keyword 'required' is needed
     required init(tag:String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
    func update(data: Data) -> Bool {
        return true
    }
}
 

//---> THE FOLLOWING STRUCT WILL NOT BE ABLE TO IMPLEMENT THE ClassDataRepresentable PROTOCOL
//---> It is missing the work 'mutating' at the function 'update'
//---> ClassDataRepresentable is restricted to classses by ':AnyObject' keyword
/*
struct test: ClassDataRepresentable {
    var tag: String
    var data: Data
    
    init(tag:String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
    func update(data: Data) -> Bool {
        return true
    }
}
 */

print("hello")
