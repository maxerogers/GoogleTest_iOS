//
//  GoogleCalendarTestTests.swift
//  GoogleCalendarTestTests
//
//  Created by Max Rogers on 8/25/16.
//  Copyright © 2016 Max Rogers. All rights reserved.
//

// Swift

import Quick
import Nimble
import Alamofire
import AlamofireObjectMapper
import Foundation
import SwiftyJSON

//enum JSONError: String, ErrorType {
//    case NoData = "ERROR: no data"
//    case ConversionFailed = "ERROR: conversion from JSON failed"
//}
//
//extension NSMutableURLRequest {
//
//    /// Percent escape
//    ///
//    /// Percent escape in conformance with W3C HTML spec:
//    ///
//    /// See http://www.w3.org/TR/html5/forms.html#application/x-www-form-urlencoded-encoding-algorithm
//    ///
//    /// - parameter string:   The string to be percent escaped.
//    /// - returns:            Returns percent-escaped string.
//
//    private func percentEscapeString(string: String) -> String {
//        let characterSet = NSCharacterSet(charactersInString: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._* ")
//
//        return string
//            .stringByAddingPercentEncodingWithAllowedCharacters(characterSet)!
//            .stringByReplacingOccurrencesOfString(" ", withString: "+", options: [], range: nil)
//    }
//
//    /// Encode the parameters for `application/x-www-form-urlencoded` request
//    ///
//    /// - parameter parameters:   A dictionary of string values to be encoded in POST request
//
//    func encodeParameters(parameters: [String : String]) {
//        HTTPMethod = "POST"
//
//        HTTPBody = parameters
//            .map { "\(percentEscapeString($0))=\(percentEscapeString($1))" }
//            .joinWithSeparator("&")
//            .dataUsingEncoding(NSUTF8StringEncoding)
//    }
//
//    func addParameters(params: [String: String]) {
//        guard let url = self.URL else { return }
//        var urlString = url.absoluteString
//        for (index, parameter) in params.keys.enumerate() {
//            if (index == 0) {
//                urlString += "?\(parameter)=\(params[parameter]!)"
//            }
//            else {
//                urlString += "&\(parameter)=\(params[parameter]!)"
//            }
//        }
//        self.URL = NSURL(string: urlString)
//    }
//}


class TableOfContentsSpec: QuickSpec {
    
    var accessToken: String?
    
    override func spec() {
        //        beforeSuite {
        //            waitUntil(timeout: 60.0) { done in
        //                let params = [
        //                    "client_id": "794323970262-120fkd2rnm46sqggqgt8pl8tl72kee15.apps.googleusercontent.com",
        //                    "refresh_token": "1/3EPCDVyNHHNbOy3m1sHPoJkWws1nOdliRn6aMkxkaj8",
        //                    "grant_type": "refresh_token"
        //                ]
        //                let url = NSURL(string: "https://www.googleapis.com/oauth2/v4/token")
        //                let request = NSMutableURLRequest(URL: url!)
        //                request.encodeParameters(params)
        //                let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        //                config.HTTPAdditionalHeaders = [
        //                    "Accept" : "application/json",
        //                    "X-Application" : "AIzaSyDanwC3Zhx3Z9lIHr_jeip98aY-PBtig0Q",
        //                    "Content-Type" : "application/x-www-form-urlencoded"
        //                ]
        //                let session = NSURLSession(configuration: config)
        //                let task = session.dataTaskWithRequest(request) { data, response, error in
        //
        //                    do {
        //                        guard let data = data else {
        //                            throw JSONError.NoData
        //                        }
        //                        let json = JSON(data: data)
        //                        self.accessToken = json["access_token"].string
        //                        let manager = Alamofire.Manager.sharedInstance
        //                        manager.session.configuration.HTTPAdditionalHeaders = [
        //                            "Accept" : "application/json",
        //                            "X-Application" : "AIzaSyDanwC3Zhx3Z9lIHr_jeip98aY-PBtig0Q",
        //                            "Content-Type" : "application/x-www-form-urlencoded",
        //                            "Authorization": "Bearer \(self.accessToken!)"
        //                        ]
        //                    } catch let error as JSONError {
        //                        print(error.rawValue)
        //                    } catch let error as NSError {
        //                        print(error.debugDescription)
        //                    }
        //                    done()
        //                }
        //                task.resume()
        //            }
        //        }
        
        describe("Google API Tests") {
            //            it("REFRESH TOKEN") {
            //                expect(self.accessToken).to(beTruthy())
            //            }
            //            it("Get Primary ID") {
            ////                let manager = Alamofire.Manager.sharedInstance
            ////                manager.session.configuration.HTTPAdditionalHeaders = [
            ////                    "Accept" : "application/json",
            ////                    "X-Application" : "AIzaSyDanwC3Zhx3Z9lIHr_jeip98aY-PBtig0Q",
            ////                    "Content-Type" : "application/x-www-form-urlencoded",
            ////                    "Authorization": "Bearer \(self.accessToken!)"
            ////                ]
            ////                let url = NSURL(string: "https://www.googleapis.com/calendar/v3/users/me/calendarList?access_token=\(self.accessToken!)")
            //                waitUntil(timeout: 60.0) { (done) in
            //                    let manager = Alamofire.Manager.sharedInstance
            //                    manager.request(.GET, "https://www.googleapis.com/calendar/v3/users/me/calendarList?access_token=\(self.accessToken!)")
            //                        .responseJSON { (response) in
            //
            //                            if let error = response.result.error {
            //                                print(error)
            //                            }
            //                            let json = JSON(rawValue: response.result.value!)
            //                            print(json)
            ////                            print(response.result.value)
            //                            done()
            //                    }
            //                }
            //            }
            //
            ////            https://developers.google.com/google-apps/calendar/v3/reference/events/list
            //            it("ABC") {
            //                waitUntil(timeout: 60.0) { (done) in
            //                    let manager = Alamofire.Manager.sharedInstance
            //                    manager.request(.GET, "https://www.googleapis.com/calendar/v3/calendars/primary/events?access_token=\(self.accessToken!)")
            //                        .responseJSON { (response) in
            //                            if let error = response.result.error {
            //                                print(error)
            //                            }
            //                            let json = JSON(rawValue: response.result.value!)
            //                            print(json)
            //                            //                            print(response.result.value)
            //                            done()
            //                    }
            //                }
            //            }
            
            //            https://developers.google.com/google-apps/calendar/v3/reference/events/list
            //            it("ABC") {
            //                waitUntil(timeout: 60.0) { (done) in
            //                    let manager = Alamofire.Manager.sharedInstance
            //                    let URL = "https://www.googleapis.com/calendar/v3/calendars/primary/events?access_token=\(self.accessToken!)"
            //                    manager.request(.GET, URL)
            //                        .responseObject(completionHandler: { (response: Response<Calendar, NSError>) in
            //
            //                            done()
            //                        })
            //                }
            //            }
            
            //            it("AlamofireObjectMapper Example") {
            //                waitUntil(timeout: 60.0) { (done) in
            //                    let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/f583be1121dbc5e9b0381b3017718a70c31054f7/sample_array_json"
            //                    Alamofire.request(.GET, URL).responseArray { (response: Response<[Forecast], NSError>) in
            //                        
            //                        let forecastArray = response.result.value
            //                        
            //                        if let forecastArray = forecastArray {
            //                            for forecast in forecastArray {
            //                                print(forecast.day)
            //                                print(forecast.temperature)           
            //                            }
            //                        }
            //                        done()
            //                    }
            //                }
            //            }
            
            it("DataManager check token") {
                waitUntil(timeout: 60.0) { (done) in
                    let manager = DataManager.sharedInstance
                    manager.updateEvents({
                        
                        done()
                    })
                }
            }
        }
    }
}