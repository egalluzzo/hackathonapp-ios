//
//  User.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 8/2/14.
//  Copyright (c) 2014 Eric Galluzzo. All rights reserved.
//

import Foundation

var _currentUser: User?;

class User: GlobalRemoteObject {
    
    var name: String = ""
    var email: String = ""
    
    class func currentUser() -> User? {
        return _currentUser;
    }
    
    class func setCurrentUser(newUser: User?) {
        _currentUser = newUser;
    }

// Trying to implement Hashable...
//    func hashValue() -> int {
//        return id.hashValue ^ creationDate.hashValue ^ name.hashValue ^ email.hashValue;
//    }
//
//    @infix func == (other: User) -> Bool {
//        return (id == other.id)
//            && (creationDate == other.creationDate)
//            && (name == other.name)
//            && (email == other.email)
//    }
}
