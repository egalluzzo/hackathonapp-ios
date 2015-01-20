//
//  DashboardViewController.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/15/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet weak var userLabel: UILabel! {
        didSet {
            NSLog("Set userLabel to %@", userLabel);
        }
    }
    @IBOutlet weak var projectsCollectionView: UICollectionView! {
        didSet {
            NSLog("Set projectsCollectionView to %@", projectsCollectionView);
        }
    }
    
    var projects: [Project] = [] {
        didSet {
            self.sortProjectsIntoCategories();
        }
    }
    
    private var dataSource: DashboardCollectionViewDataSource!;
    
    private let yourProjectsCategory = DashboardCategory(name: "Your Projects");
    private let recentIdeasCategory = DashboardCategory(name: "Recent Ideas");
    private let allProjectsCategory = DashboardCategory(name: "All Projects");
    private var categories: [DashboardCategory] = []; // can't seem to initialize this here for some reason
    
    override func viewDidLoad() {
        NSLog("viewDidLoad");
        
        projectsCollectionView.registerNib(UINib(nibName: "ProjectCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "ProjectCollectionViewCell");
        projectsCollectionView.registerNib(UINib(nibName: "HackathonSectionHeader", bundle: nil),
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: "HackathonSectionHeader");
        
        // I have to make this a variable for some reason; otherwise it seems to use
        // NSCFString as a data source even though I set it to our custom one.
        
        categories = [yourProjectsCategory, recentIdeasCategory, allProjectsCategory];
        dataSource = DashboardCollectionViewDataSource(categories: categories);
        projectsCollectionView.dataSource = self.dataSource;
        
        let otherUser = createUser(name: "Other Guy", email: "otherguy@example.com");
        let hackathon = createHackathon(name: "Hackathon #3");
        projects = [
            createProject(name: "Hackathon App", hackathon: hackathon),
            createProject(name: "Someone Else's Project", creator: otherUser, hackathon: hackathon),
            createProject(name: "Another Project", creator: otherUser, hackathon: hackathon),
            createProject(name: "Bright Idea", hackathon: nil),
            createProject(name: "Bad Idea", hackathon: nil)];
        
        userLabel.text = User.currentUser()?.name;
    }
    
    private func createProject(#name: String, creator: User = User.currentUser()!, hackathon: Hackathon?) -> Project {
        let project = Project(group: Group.currentGroup()!, creator: creator);
        project.name = name;
        project.hackathon = hackathon;
        return project;
    }
    
    private func createUser(#name: String, email: String) -> User {
        let user = User(creator: User.currentUser()!);
        user.name = name;
        user.email = email;
        return user;
    }
    
    private func createHackathon(#name: String) -> Hackathon {
        let hackathon = Hackathon(group: Group.currentGroup()!, creator: User.currentUser()!);
        hackathon.name = "Hackathon #3";
        return hackathon;
    }
    
    private func sortProjectsIntoCategories() {
        recentIdeasCategory.projects = projects.filter({ (p: Project) -> Bool in
            return p.idea;
        });
        
        yourProjectsCategory.projects = projects.filter({ (p: Project) -> Bool in
            // FIXME: Use ==, not ===, after it's implemented
            return !p.idea && (p.creator? === User.currentUser());
        });
        
        allProjectsCategory.projects = projects.filter({ (p: Project) -> Bool in
            // FIXME: Use !=, not !==, after it's implemented
            return !p.idea;
        });
        
        for category in categories {
            category.sortByDateDescending();
        }
        
        projectsCollectionView.reloadData();
    }
}
