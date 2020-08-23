//
//  EventsManagerTests.swift
//  EventsTests
//
//  Created by Zofia Drabek on 09/02/2020.
//  Copyright © 2020 Zofia Drabek. All rights reserved.
//

import XCTest
@testable import Events

class EventsManagerTests: XCTestCase {

    func testAddEvent() {
        let eventsManager = EventsManager()
        let title = "Birthday"
        let date = Date.init()
        let event = Event(title: title, date: date)
        eventsManager.addEvent(title: title, date: date)
        XCTAssertEqual(eventsManager.events.last, event)
    }
    
    func testEditEvent() {
        let eventsManager = EventsManager()
        let title = "Birthday"
        let date = Date.init()
        eventsManager.addEvent(title: title, date: date)
        
        let newTitle = "Anniversary"
        let newDate = Date.init()
        let event = Event(title: newTitle, date: newDate)
        eventsManager.editEvent(event, at: 0)
        XCTAssertEqual(eventsManager.events[0], event)
    }
    
    func testGetEvent() {
        let eventsManager = EventsManager()
        let title = "Birthday"
        let date = Date.init()
        let event = Event(title: title, date: date)
        eventsManager.addEvent(title: title, date: date)
        
        let recivedEvent = eventsManager.getEvent(at: 0)
        XCTAssertEqual(recivedEvent, event)
    }

    func testRemoveEvent() {
        let eventsManager = EventsManager()
        let title = "Birthday"
        let date = Date.init()
        let event = Event(title: title, date: date)
        eventsManager.addEvent(title: title, date: date)
        
        eventsManager.removeEvent(at: 0)
        
        XCTAssert(!eventsManager.events.contains(event))
        XCTAssertEqual(eventsManager.events.count, 0)
    }
    
    func testGetNumberOfEvents() {
        let eventsManager = EventsManager()
        let title = "Birthday"
        let date = Date.init()
        eventsManager.addEvent(title: title, date: date)
        
        XCTAssertEqual(eventsManager.events.count, 1)
    }

}
