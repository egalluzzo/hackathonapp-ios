//
//  ProjectCollectionViewDataSource.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/20/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import UIKit

class ProjectCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let project: Project;
    
    init(project: Project) {
        self.project = project;
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (section) {
        case 0: return 0;
//        case 1: return project.userRoles.count;
//        case 2: return project.ratingCategories.count;
        case 1: return 3;
        case 2: return 5;
        default:
            return 0;
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch (indexPath.section) {
        case 0:
            // FIXME: No exceptions in Swift, and can't return an NSError.  Language fail!
            return collectionView.dequeueReusableCellWithReuseIdentifier("Shouldn't be trying to get this cell", forIndexPath: indexPath) as UICollectionViewCell;
        case 1:
            var cell = collectionView.dequeueReusableCellWithReuseIdentifier("UserRoleCollectionViewCell", forIndexPath: indexPath) as UserRoleCollectionViewCell;
            cell.userLabel.text = ["Eric Galluzzo", "Fola Sobojevo", "Smriti Madan"][indexPath.row];
            cell.roleLabel.text = ["Administrator", "Administrator", "Member"][indexPath.row];
            return cell;
        case 2:
            var cell = collectionView.dequeueReusableCellWithReuseIdentifier("RatingCollectionViewCell", forIndexPath: indexPath) as RatingCollectionViewCell;
            cell.categoryLabel.text = ["Innovation", "Implementation", "Awesomeness", "Aesthetics", "Coolness"][indexPath.row];
            cell.ratingProgressView.progress = [0.7, 0.9, 0.85, 0.55, 0.75][indexPath.row];
            return cell;
        default:
            // FIXME: No exceptions in Swift, and can't return an NSError.  Language fail!
            return collectionView.dequeueReusableCellWithReuseIdentifier("Shouldn't be trying to get this cell", forIndexPath: indexPath) as UICollectionViewCell;
        }
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch (kind) {
        case UICollectionElementKindSectionHeader:
            switch (indexPath.section) {
            case 0:
                var headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "ProjectFixedDetailsHeaderView", forIndexPath: indexPath) as ProjectFixedDetailsHeaderView;
                headerView.userLabel.text = project.creator?.name;
                headerView.projectDescriptionLabel.text = project.description;
                return headerView;
            case 1:
                var headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HackathonSectionHeader", forIndexPath: indexPath) as HackathonSectionHeader;
                headerView.sectionHeaderLabel.text = "Team";
                headerView.viewAllButton.hidden = true;
                return headerView;
            case 2:
                var headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HackathonSectionHeader", forIndexPath: indexPath) as HackathonSectionHeader;
                headerView.sectionHeaderLabel.text = "Ratings";
                headerView.viewAllButton.hidden = true;
                return headerView;
            default:
                // FIXME: No exceptions in Swift, and can't return an NSError.  Language fail!
                return collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Shouldn't be trying to get this header view", forIndexPath: indexPath) as UICollectionReusableView;
            }
        default:
            // FIXME: No exceptions in Swift, and can't return an NSError.  Language fail!
            return collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Shouldn't be trying to get this header view", forIndexPath: indexPath) as UICollectionReusableView;
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        switch (indexPath.section) {
        case 0:
            return CGSizeZero;
        case 1:
            return CGSize(width: 300, height: 32);
        case 2:
            return CGSize(width: collectionView.bounds.width - 20, height: 20);
        default:
            return CGSizeZero;
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch (section) {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: 200);
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 50);
        case 2:
            return CGSize(width: collectionView.bounds.width, height: 50);
        default:
            return CGSizeZero;
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSizeZero;
    }
}
