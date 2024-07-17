//
//  Colors.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class Colors {
    
    static func colorFromRGB(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
    }
    
    static let tint = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 16, green: 16, blue: 16)
        } else {
            return colorFromRGB(red: 252, green: 252, blue: 252)
        }
    }
    
    static let background1 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 242, green: 242, blue: 242)
        } else {
            return colorFromRGB(red: 10, green: 10, blue: 10)
        }
    }
    
    static let background2 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 250, green: 250, blue: 250)
        } else {
            return colorFromRGB(red: 31, green: 31, blue: 31)
        }
    }
    
    static let background3 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 242, green: 242, blue: 242)
        } else {
            return colorFromRGB(red: 31, green: 31, blue: 31)
        }
    }
    
    static let placeholder = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 168, green: 168, blue: 168)
        } else {
            return colorFromRGB(red: 126, green: 126, blue: 126)
        }
    }
    
    static let border = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 229, green: 229, blue: 229)
        } else {
            return colorFromRGB(red: 44, green: 44, blue: 44)
        }
    }
    
    static let defaultPictureTint = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 104, green: 104, blue: 104)
        } else {
            return colorFromRGB(red: 182, green: 182, blue: 182)
        }
    }
    
}
