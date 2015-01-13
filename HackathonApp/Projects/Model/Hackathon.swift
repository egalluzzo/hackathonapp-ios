//
//  Hackathon.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 8/2/14.
//  Copyright (c) 2014 Eric Galluzzo. All rights reserved.
//

import Foundation

class Hackathon: RemoteObject {
    var name: String = "";
    var date: NSDate = NSDate();
    var projects: [Project] = [];
}
