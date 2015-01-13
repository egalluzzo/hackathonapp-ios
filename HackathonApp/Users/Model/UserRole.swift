//
//  UserRole.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 8/2/14.
//  Copyright (c) 2014 Eric Galluzzo. All rights reserved.
//

import Foundation

class UserRole {
    let user: User
    let role: Role
    
    init(user: User, role: Role) {
        self.user = user;
        self.role = role;
    }
}
