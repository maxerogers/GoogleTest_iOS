//
//  DataManager.swift
//  GoogleCalendarTest
//
//  Created by Max Rogers on 8/26/16.
//  Copyright © 2016 Max Rogers. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

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

    /**
     Percent escape in conformance with W3C HTML spec:
     
     [See W3 Specification](http://www.w3.org/TR/html5/forms.html#application/x-www-form-urlencoded-encoding-algorithm)
     
     - parameters:
         - string: The string to be percent escaped
     - returns: a percent-escaped string.
     */
    
    
    private func percentEscapeString(string: String) -> String {
        let characterSet = NSCharacterSet(charactersInString: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._* ")
        
        return string
            .stringByAddingPercentEncodingWithAllowedCharacters(characterSet)!
            .stringByReplacingOccurrencesOfString(" ", withString: "+", options: [], range: nil)
    }
    
    /**
     Encode the parameters for `application/x-www-form-urlencoded` request
     
     - parameters:
        - parameters: A dictionary of string values to be encoded in POST request
     */

    func encodeParameters(parameters: [String : String]) {
        HTTPMethod = "POST"
        
        HTTPBody = parameters
            .map { "\(percentEscapeString($0))=\(percentEscapeString($1))" }
            .joinWithSeparator("&")
            .dataUsingEncoding(NSUTF8StringEncoding)
    }
    
    /**
     Append the parameters for a url query. 
     
     e.g. http://icecream_maker.com/cones?flavor=vanilla&topping=sprinkles
     
     [see wikipedia](https://en.wikipedia.org/wiki/Query_string)
     
     - parameters:
         - params: A dictionary of string values to be encoded in the url's query
     */
    
    func addURLQuery(params: [String: String]) {
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

class DataManager {
    let clientID = "794323970262-120fkd2rnm46sqggqgt8pl8tl72kee15.apps.googleusercontent.com"
    let refreshToken = "1/3EPCDVyNHHNbOy3m1sHPoJkWws1nOdliRn6aMkxkaj8"
    
    var calendar: Calendar?
    var events: [CalendarEvent]?
    var accessExpirationDate: NSDate?
    var accessToken: String?
    let alamoFire = Alamofire.Manager.sharedInstance
    
    static let sharedInstance = DataManager()
    private init() {
        alamoFire.session.configuration.HTTPAdditionalHeaders = [
            "Accept" : "application/json",
            "X-Application" : "AIzaSyDanwC3Zhx3Z9lIHr_jeip98aY-PBtig0Q",
            "Content-Type" : "application/x-www-form-urlencoded",
            
//            "Authorization": "Bearer \(self.accessToken!)"
        ]
    } // prevents others from using the default initializer for this class
    
    private func updateAccessToken(completionHandler:()->()) {
        //todo
        let params = [
            "client_id": clientID,
            "refresh_token": refreshToken,
            "grant_type": "refresh_token"
        ]
        let url = NSURL(string: "https://www.googleapis.com/oauth2/v4/token")
        let request = NSMutableURLRequest(URL: url!)
        request.encodeParameters(params)
        self.alamoFire.request(request).responseJSON { (response) in
            
            defer { completionHandler() }
            if let error = response.result.error {
                print(error.localizedDescription)
            }
            else {
                if let json = JSON(rawValue: response.result.value!) {
                    self.accessToken = json["access_token"].string!
                    self.accessExpirationDate = NSDate()
                }
            }
        }
        
    }
    
    private func checkAccessToken(completionHandler:()->()) {
        guard let _ = self.accessToken else {
            updateAccessToken(completionHandler)
            return
        }
        if let diff = accessExpirationDate?.timeIntervalSinceDate(NSDate())
            where (diff * -1) < 3600 {
            updateAccessToken(completionHandler)
        } else {
            completionHandler()
        }
    }
    
    func updateEvents(completionHandler:()->()) {
        checkAccessToken() {
            let URL = "https://www.googleapis.com/calendar/v3/calendars/primary/events?access_token=\(self.accessToken!)"
            self.alamoFire.request(.GET, URL).responseObject() {
                (response: Response<Calendar, NSError>) in
                
                defer { completionHandler() }
                if let result = response.result.value {
                    self.calendar = result
                    self.events = result.events
                }
            }
        }
    }
    
}