//
//  Colors.swift
//  HackathonApp
//
//  Created by Eric Galluzzo on 1/14/15.
//  Copyright (c) 2015 Eric Galluzzo. All rights reserved.
//

import UIKit

var _accentColor = UIColor(red: 58/255, green: 175/255, blue: 64/255, alpha: 1);
var _lightBackgroundColor = UIColor(red: 236/255, green: 235/255, blue: 234/255, alpha: 1);
var _darkBackgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1);
var _textColor = UIColor(red: 104/255, green: 104/255, blue: 104/255, alpha: 1);

class Theme {
    class func accentColor() -> UIColor {
        return _accentColor;
    }
    
    class func cardBackgroundColor() -> UIColor {
        return _lightBackgroundColor;
    }
    
    class func cardBorderColor() -> UIColor {
        return _darkBackgroundColor;
    }
    
    class func cardBorderWidth() -> CGFloat {
        return 1.0;
    }
    
    class func cardCornerRadius() -> CGFloat {
        return 3.0;
    }
    
    class func textColor() -> UIColor {
        return _textColor;
    }
    
    class func themeCardView(#view: UIView) {
        view.layer.borderColor = Theme.cardBorderColor().CGColor;
        view.layer.backgroundColor = Theme.cardBackgroundColor().CGColor;
        view.layer.borderWidth = Theme.cardBorderWidth();
        view.layer.cornerRadius = Theme.cardCornerRadius();
    }
}
