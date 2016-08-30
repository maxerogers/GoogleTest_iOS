//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public extension SequenceType where Generator.Element: Hashable {
    var uniqueElements: [Generator.Element] {
        return Array(
            Set(self)
        )
    }
}
public extension SequenceType where Generator.Element: Equatable {
    var uniqueElements: [Generator.Element] {
        return self.reduce([]){uniqueElements, element in
            uniqueElements.contains(element)
                ? uniqueElements
                : uniqueElements + [element]
        }
    }
}

extension NSMutableURLRequest {
    func addParameters(params: [String: String]) {
        guard let url = self.URL else { return }
        
        let components = NSURLComponents(string: url.absoluteString)
        if components?.queryItems == nil {
            components?.queryItems = [NSURLQueryItem]()
        }
        for (_, parameter) in params.keys.enumerate() {
            let query = NSURLQueryItem(name: parameter, value: params[parameter])
            components?.queryItems?.append(query)
        }
        components?.queryItems = components?.queryItems?.uniqueElements
        self.URL = components?.URL
    }
}

let request = NSMutableURLRequest(URL: NSURL(string: "http://www.google.com")!)
request.addParameters(["a":"b"])
print(request.URL!.absoluteString)
request.addParameters(["a":"b"])
print(request.URL!.absoluteString)

let mySet = Set(["a", "b", "a"])  // Set<String>
let myArray = Array(mySet)        // Array<String>
print(myArray) // [b, a]

//func genData() -> NSDate? {
//    return NSDate(timeIntervalSinceNow: -100)
//}
//let date = genData()
//let date2 = NSDate()
//
//date?.timeIntervalSinceDate(date2)
//
////date2.timeIntervalSinceDate(date)

//dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { 
//    print("Batman")
//}
//dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
//    print("Catwoman")
//}
//print("Robin")

