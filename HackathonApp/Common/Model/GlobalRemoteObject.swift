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
    let creator: User?;
    var lastUpdateDate: NSDate = NSDate();
    var lastUpdater: User?;
    
    init(id: String, creationDate: NSDate, creator: User?, lastUpdateDate: NSDate, lastUpdater: User?) {
        self.id = id;
        self.creationDate = creationDate;
        self.creator = creator;
        self.lastUpdateDate = lastUpdateDate;
        self.lastUpdater = lastUpdater;
    }
    
    init(creator: User?) {
        self.creator = creator;
        self.lastUpdater = creator;
    }
}
