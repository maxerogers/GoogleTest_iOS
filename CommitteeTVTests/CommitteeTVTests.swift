//
//  GoogleCalendarTestTests.swift
//  GoogleCalendarTestTests
//
//  Created by Max Rogers on 8/25/16.
//  Copyright © 2016 Max Rogers. All rights reserved.
//

import Quick
import Nimble
import Alamofire
import AlamofireObjectMapper
import Foundation
import SwiftyJSON

class TableOfContentsSpec: QuickSpec {
    
    var accessToken: String?
    
    override func spec() {
        describe("Google API Tests") {
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