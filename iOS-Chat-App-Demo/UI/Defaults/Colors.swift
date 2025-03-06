//
//  Colors.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li
//

import UIKit

class Colors {
    
    static func colorFromRGB(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
    }
    
    static let gray1 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 4, green: 4, blue: 4)
        } else {
            return colorFromRGB(red: 255, green: 255, blue: 255)
        }
    }
    
    static let gray2 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 62, green: 62, blue: 62)
        } else {
            return colorFromRGB(red: 232, green: 232, blue: 232)
        }
    }
    
    static let gray3 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 94, green: 94, blue: 94)
        } else {
            return colorFromRGB(red: 232, green: 232, blue: 232)
        }
    }
    
    static let gray4 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 136, green: 136, blue: 136)
        } else {
            return colorFromRGB(red: 232, green: 232, blue: 232)
        }
    }
    
    static let gray5 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 245, green: 245, blue: 245)
        } else {
            return colorFromRGB(red: 20, green: 20, blue: 20)
        }
    }
    
    static let gray6 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 255, green: 255, blue: 255)
        } else {
            return colorFromRGB(red: 33, green: 33, blue: 33)
        }
    }
    
    static let gray7 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 255, green: 255, blue: 255)
        } else {
            return colorFromRGB(red: 40, green: 40, blue: 40)
        }
    }
    
    static let gray8 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 255, green: 255, blue: 255)
        } else {
            return colorFromRGB(red: 52, green: 52, blue: 52)
        }
    }
    
    static let gray9 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 246, green: 246, blue: 246)
        } else {
            return colorFromRGB(red: 30, green: 30, blue: 30)
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
    
    static let selfMessageBackground = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 16, green: 148, blue: 110)
        } else {
            return colorFromRGB(red: 7, green: 85, blue: 68)
        }
    }
    
    static let defaultPictureTint = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 144, green: 144, blue: 144)
        } else {
            return colorFromRGB(red: 182, green: 182, blue: 182)
        }
    }
    
}
