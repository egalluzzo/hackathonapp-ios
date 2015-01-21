//
//  ProjectViewController.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/20/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import UIKit

class ProjectViewController: UICollectionViewController {
    var project: Project? {
        didSet {
            if (self.isViewLoaded()) {
                self.reloadScreenFromProject();
            }
        }
    }
    
    private var dataSource: ProjectCollectionViewDataSource?;

    override func viewDidLoad() {
        super.viewDidLoad();

        // Register cell classes
        self.collectionView!.registerNib(UINib(nibName: "ProjectFixedDetailsHeaderView", bundle: nil),
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: "ProjectFixedDetailsHeaderView");
        self.collectionView!.registerNib(UINib(nibName: "HackathonSectionHeader", bundle: nil),
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: "HackathonSectionHeader");
        self.collectionView!.registerNib(UINib(nibName: "UserRoleCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "UserRoleCollectionViewCell");
        self.collectionView!.registerNib(UINib(nibName: "RatingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RatingCollectionViewCell");
        
        self.reloadScreenFromProject();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    private func reloadScreenFromProject() {
        self.dataSource = ProjectCollectionViewDataSource(project: project!);
        self.collectionView!.dataSource = self.dataSource;
        self.collectionView!.delegate = self.dataSource;
        
        self.navigationItem.title = project?.name;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}
