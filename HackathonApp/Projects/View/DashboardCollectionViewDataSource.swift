//
//  DashboardCollectionViewDataSource.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/18/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import UIKit

class DashboardCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    let categories: [DashboardCategory];
    
    init(categories: [DashboardCategory]) {
        self.categories = categories;
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return categories.count;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories[section].projects.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProjectCollectionViewCell", forIndexPath: indexPath) as ProjectCollectionViewCell;
        var project = categories[indexPath.section].projects[indexPath.row];
        cell.projectNameLabel.text = project.name;
        cell.statusLabel.text = project.creator?.name;
        return cell;
    }
    
    func collectionView(
        collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath)
        -> UICollectionReusableView
    {
        var view = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HackathonSectionHeader", forIndexPath: indexPath) as HackathonSectionHeader;
        view.sectionHeaderLabel.text = categories[indexPath.section].name;
        return view;
    }
    
    func projectAtIndexPath(indexPath: NSIndexPath) -> Project {
        return categories[indexPath.section].projects[indexPath.row];
    }
}
