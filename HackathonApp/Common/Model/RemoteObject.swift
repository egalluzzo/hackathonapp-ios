//
//  RemoteObject.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 8/2/14.
//  Copyright (c) 2014 Eric Galluzzo. All rights reserved.
//

import Foundation

class RemoteObject: GlobalRemoteObject {
    let group: Group;
    
    init(id: String, creationDate: NSDate, group: Group, creator: User?, lastUpdateDate: NSDate, lastUpdater: User?) {
        self.group = group;
        super.init(id: id, creationDate: creationDate, creator: creator, lastUpdateDate: lastUpdateDate, lastUpdater: lastUpdater);
    }
    
    init(group: Group, creator: User) {
        self.group = group;
        super.init(creator: creator);
    }
    
    convenience init() {
        self.init(group: Group.currentGroup()!, creator: User.currentUser()!);
    }
}
