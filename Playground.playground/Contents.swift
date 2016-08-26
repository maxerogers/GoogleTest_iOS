//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension NSMutableURLRequest {
    func addParameters(params: [String: String]) {
        guard let url = self.URL else { return }
        var urlString = url.absoluteString
        for (index, parameter) in params.keys.enumerate() {
            if (index == 0) {
                urlString += "?\(parameter)=\(params[parameter]!)"
            }
            else {
                urlString += "&\(parameter)=\(params[parameter]!)"
            }
        }
        self.URL = NSURL(string: urlString)
    }
}

let request = NSMutableURLRequest(URL: NSURL(string: "http://www.google.com/")!)
request.addParameters(["a":"b"])
print(request.URL!.absoluteString)


func genData() -> NSDate? {
    return NSDate(timeIntervalSinceNow: -100)
}
let date = genData()
let date2 = NSDate()

date?.timeIntervalSinceDate(date2)

//date2.timeIntervalSinceDate(date)

dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { 
    print("Batman")
}
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
    print("Catwoman")
}
print("Robin")

