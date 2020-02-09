//
//  Events.swift
//  Events
//
//  Created by Zofia Drabek on 09/02/2020.
//  Copyright © 2020 Zofia Drabek. All rights reserved.
//

import Foundation

class Events {
    private var events: [Event] = []
    
    func addEvent(title: String, date: Date) {
        let newEvent = Event(title: title, date: date)
        events.append(newEvent)
    }
    
    func getEvents() -> [Event] {
        return events
    }
    
    func editEvent(_ newEvent: Event, at index: Int) {
        events[index] = newEvent
    }
    
    func removeEvent(at index: Int) {
        events.remove(at: index)
    }
}
