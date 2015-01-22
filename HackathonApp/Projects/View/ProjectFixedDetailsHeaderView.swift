//
//  ProjectFixedDetailsHeaderView.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/20/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import UIKit

class ProjectFixedDetailsHeaderView: UICollectionReusableView {
    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectStatusLabel: UILabel!
    @IBOutlet weak var projectDescriptionLabel: UITextView!
    @IBOutlet weak var repositoryUrlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib();
        var tapRecognizer = UITapGestureRecognizer(target: self, action: "repositoryUrlTapped:");
        repositoryUrlLabel.addGestureRecognizer(tapRecognizer);
    }
    
    func repositoryUrlTapped(sender: AnyObject?) {
        var url = NSURL(string: repositoryUrlLabel.text!);
        if let nonEmptyUrl = url {
            UIApplication.sharedApplication().openURL(nonEmptyUrl);
        }
    }
}
