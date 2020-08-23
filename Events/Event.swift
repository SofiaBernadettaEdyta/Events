//
//  Event.swift
//  Events
//
//  Created by Zofia Drabek on 09/02/2020.
//  Copyright © 2020 Zofia Drabek. All rights reserved.
//

import Foundation

struct Event: Equatable {
    var title: String
    var date: Date
    
    init(title: String, date: Date) {
        self.title = title
        self.date  = date
    }
}
