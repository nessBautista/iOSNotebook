import UIKit

/*
    Benefits of depency injection
    - Transparency: Responsabilities and requirements of the class become more clear
    - Unit Testing: It makes easier to test. BY replacing objects dependencies with 'mock' objects. It helps to isolate behavior
    - Separation of concerns:
    - Reduce Coupling
 */



////////////////---> 3 TYPES OF DEPENDENCY INJECTION
/*
    Intializer injection:
    The injected instance can't be mutated. You can be sure that the properties will not be repeated multiple times
 */

//class DataManagerInit{
//    private let serializer: Serializer
//}


/*
    Intializer property injection
    Properties are injected after creation of object. Properties can be changed at any time.
 */
class RequestManager {
    
}
class ViewController1:UIViewController {
    var requestManager: RequestManager?     //--> The class needs a request manager
}
let vc = ViewController1()                  //--> Instance of class is created
vc.requestManager = RequestManager()        //--> Then dependency is injected


/*Method injection*/



////////////////---> DEPENDENCY INJECTION WITH PROTOCOLS
protocol Serializer {
    
    func serialize(data: Any?)-> Data?
}

class RequestSerializer: Serializer {
    func serialize(data: Any?) -> Data? {
        return nil
    }
}

//---> Class with dependency need it
class DataManager {
    var serializer: Serializer?
}
let dataManager = DataManager()
dataManager.serializer = RequestSerializer()


////////////////---> DEPENDENCY INJECTION FOR TESTING

//By using protocols and dependency injection, you can create 'mock' classes for creating tests
class MockSerializer: Serializer {
    func serialize(data: Any?) -> Data? {
        return Data(base64Encoded: "Mock data")
    }
}

let mockDataManager = DataManager()
mockDataManager.serializer = MockSerializer()
