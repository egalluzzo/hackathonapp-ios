//
//  Project.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 8/2/14.
//  Copyright (c) 2014 Eric Galluzzo. All rights reserved.
//

import Foundation

enum ProjectStatus {
    case NotStarted
    case PrototypeInProgress
    case PrototypeComplete
    case ScheduledForImplementation
    case ImplementationInProgress
    case ImplementationComplete
    case Shipped
}

class Project: RemoteObject {
    var name: String = ""
    var status: ProjectStatus = .NotStarted;
    var description: String = "";
    var avatarUrl: String = "";
    var repositoryUrl: String = "";
    var hackathon: Hackathon?;
}
