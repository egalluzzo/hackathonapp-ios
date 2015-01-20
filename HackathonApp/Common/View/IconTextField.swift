//
//  IconTextField.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/15/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import UIKit

class IconTextField : UITextField {
    var leftInset: CGFloat = 8;
    var image: UIImage? {
        didSet {
            if (image == nil) {
                self.leftView = nil;
                self.leftViewMode = UITextFieldViewMode.Never;
            } else {
                self.leftView = UIImageView(image: image);
                self.leftViewMode = UITextFieldViewMode.Always;
            }
        }
    }
    
    override func leftViewRectForBounds(bounds: CGRect) -> CGRect {
        var rect = super.leftViewRectForBounds(bounds);
        return CGRectOffset(rect, self.leftInset, 0);
    }
}