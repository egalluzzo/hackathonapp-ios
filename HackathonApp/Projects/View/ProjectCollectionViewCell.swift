//
//  ProjectCollectionViewCell.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/13/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        self.layer.borderColor = Colors.darkBackgroundColor().CGColor;
        self.layer.backgroundColor = Colors.lightBackgroundColor().CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 3.0;
    }
}