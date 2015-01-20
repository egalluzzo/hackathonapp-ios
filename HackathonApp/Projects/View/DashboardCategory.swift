//
//  DashboardCategory.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/18/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import Foundation

class DashboardCategory: NSObject {
    var name: String;
    var projects: [Project] = [];
    
    init(name: String) {
        self.name = name;
    }
    
    func clear() {
        projects = [];
    }
    
    func addProject(project: Project) {
        projects.append(project);
    }
    
    func sortByDateDescending() {
        projects.sort { (p1: Project, p2: Project) -> Bool in
            return p1.creationDate.compare(p2.creationDate) == NSComparisonResult.OrderedDescending;
        }
    }
}
