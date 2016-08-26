//
//  CalendarEvent.swift
//  GoogleCalendarTest
//
//  Created by Max Rogers on 8/26/16.
//  Copyright © 2016 Max Rogers. All rights reserved.
//

import Foundation
import ObjectMapper

class Calendar: Mappable {
    var summary: String?
    var timeZone: String?
    var updated: String?
    var events: [CalendarEvent]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        timeZone <- map["timeZone"]
        summary <- map["summary"]
        updated <- map["updated"]
        events <- map["items"]
    }
}

class CalendarEvent: Mappable {
    var summary: String?
    var organizer: String?
    var startTime: NSDate?
    var endTime: NSDate?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        summary <- map["summary"]
        organizer <- map["organizer.displayName"]
        
        startTime <- (map["start.dateTime"], ISO8601DateTransform())
        endTime <- (map["end.dateTime"], ISO8601DateTransform())
    }
}