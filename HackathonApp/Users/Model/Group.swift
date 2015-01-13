//
//  Group.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 8/2/14.
//  Copyright (c) 2014 Eric Galluzzo. All rights reserved.
//

import Foundation

var _currentGroup: Group?;

class Group: GlobalRemoteObject {
    var name: String = ""
    let userRoles: [UserRole] = []
    
    class func currentGroup() -> Group? {
        return _currentGroup;
    }
    
    class func setCurrentGroup(newGroup: Group?) {
        _currentGroup = newGroup;
    }
}
