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
    @IBOutlet weak var dividerView: UIView!
    
    override func awakeFromNib() {
        Theme.themeCardView(view: self);
        dividerView.backgroundColor = Theme.cardBorderColor();
    }
}