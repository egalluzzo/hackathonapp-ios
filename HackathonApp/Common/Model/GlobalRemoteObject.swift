//
//  GlobalRemoteObject.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 8/2/14.
//  Copyright (c) 2014 Eric Galluzzo. All rights reserved.
//

import Foundation

class GlobalRemoteObject {
    let id: String = NSUUID().UUIDString;
    let creationDate: NSDate = NSDate();
    let creator: User;
    
    init(id: String, creationDate: NSDate, creator: User) {
        self.id = id;
        self.creationDate = creationDate;
        self.creator = creator;
    }
    
    init(creator: User) {
        self.creator = creator;
    }
}
