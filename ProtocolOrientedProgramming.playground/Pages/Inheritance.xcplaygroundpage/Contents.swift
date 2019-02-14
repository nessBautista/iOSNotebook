//: [Previous](@previous)

import Foundation


//This is a simple protocol, but lets suppose it is required to add new functionality
protocol BinaryRepresentable {
    var tag: String {get}
    var data: Data {get}
    init(tag: String, data: Data)
    
    //New funtionality requirements
    //Persistence
    //Base 64 Encoding
    
}

//---> The new functionality will be added using inheritance


//PROTOCOL: Persistence
protocol BinaryPersistable: BinaryRepresentable {
    init(tag: String, contentsOf: URL) throws
    func persist(url: URL) throws
}

//Default implementation for BinaryPersistable
extension BinaryPersistable {
    init(tag: String, contentsOf: URL) throws {
        let data = try Data.init(contentsOf: contentsOf)
        self.init(tag:tag, data: data)
    }
    
    func persist(url: URL) throws {
        try self.data.write(to: url)
    }
}


//Base 64 Encoding
protocol Base64Encodable: BinaryRepresentable {
    var base64: String {get}
}

//Default implementation for Base64Encodable
extension Base64Encodable {
    var base64: String {
        return self.data.base64EncodedString()
    }
}


//---> IMPLEMENTATION OF PROTOCOLS
struct PersistableData: BinaryPersistable {
    var tag: String
    var data:Data
}

struct EncodableData: Base64Encodable {
    var tag: String
    var data:Data
}
print("Notice how short is the implementation of the protocols.\nThis is because the default behavior implemented at the protocol extensions ")
