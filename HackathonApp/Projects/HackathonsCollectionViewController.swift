//
//  HackathonsCollectionViewController.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 7/30/14.
//  Copyright (c) 2014 Eric Galluzzo. All rights reserved.
//

import UIKit

class HackathonsCollectionViewController: UICollectionViewController {
    var hackathons: [Hackathon] = [];
    
    override func awakeFromNib() {
        hackathons = [
            createHackathon(name: "Hackathon #3", date: NSDate(timeIntervalSinceNow: 0*24*60*60), projects: [
                createProject(name: "My Project"),
                createProject(name: "My Other Project"),
                createProject(name: "Something Else")
            ]),
            createHackathon(name: "Hackathon #2", date: NSDate(timeIntervalSinceNow: -30*24*60*60), projects: []),
            createHackathon(name: "Hackathon #1", date: NSDate(timeIntervalSinceNow: -60*24*60*60), projects: []),
        ];
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return hackathons.count;
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hackathons[section].projects.count;
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var hackathon = hackathons[indexPath.section];
        var sectionHeader = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HackathonSectionHeader", forIndexPath: indexPath) as HackathonSectionHeader;
        var dateFormat = NSDateFormatter();
        dateFormat.dateFormat = "M/d/yyyy";
        sectionHeader.sectionHeaderLabel.text = "\(hackathon.name) - \(dateFormat.stringFromDate(hackathon.date))";
        return sectionHeader;
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var project = hackathons[indexPath.section].projects[indexPath.row];
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProjectCollectionViewCell", forIndexPath: indexPath) as ProjectCollectionViewCell;
        cell.projectNameLabel.text = project.name;
        cell.statusLabel.text = projectStatusText(status: project.status);
        return cell;
    }
    
    private func createProject(#name: String) -> Project {
        var project = Project();
        project.name = name;
        return project;
    }
    
    private func createHackathon(#name: String, date: NSDate, projects: [Project]) -> Hackathon {
        var hackathon = Hackathon();
        hackathon.name = name;
        hackathon.date = date;
        hackathon.projects = projects;
        for project in projects {
            project.hackathon = hackathon;
        }
        return hackathon;
    }
    
    private func projectStatusText(#status: ProjectStatus) -> String {
        switch (status) {
        case .NotStarted:
            return "Not Started";
        case .PrototypeInProgress:
            return "Prototype in Progress";
        case .PrototypeComplete:
            return "Prototype Complete";
        case .ScheduledForImplementation:
            return "Scheduled for Implementation";
        case .ImplementationInProgress:
            return "Implementation in Progress";
        case .ImplementationComplete:
            return "Implementation Complete";
        case .Shipped:
            return "Shipped";
        default:
            return "Unknown";
        }
    }
}
