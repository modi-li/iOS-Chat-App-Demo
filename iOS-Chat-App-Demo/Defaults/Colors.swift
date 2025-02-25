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
    
    static let gray1 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 4, green: 4, blue: 8)
        } else {
            return colorFromRGB(red: 255, green: 255, blue: 255)
        }
    }
    
    static let gray2 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 62, green: 62, blue: 66)
        } else {
            return colorFromRGB(red: 232, green: 232, blue: 236)
        }
    }
    
    static let gray3 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 94, green: 94, blue: 98)
        } else {
            return colorFromRGB(red: 232, green: 232, blue: 236)
        }
    }
    
    static let gray4 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 251, green: 251, blue: 255)
        } else {
            return colorFromRGB(red: 8, green: 8, blue: 12)
        }
    }
    
    static let gray5 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 245, green: 245, blue: 249)
        } else {
            return colorFromRGB(red: 20, green: 20, blue: 24)
        }
    }
    
    static let gray6 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 255, green: 255, blue: 255)
        } else {
            return colorFromRGB(red: 40, green: 40, blue: 44)
        }
    }
    
    static let gray7 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 255, green: 255, blue: 255)
        } else {
            return colorFromRGB(red: 50, green: 50, blue: 54)
        }
    }
    
    static let gray8 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 242, green: 242, blue: 246)
        } else {
            return colorFromRGB(red: 30, green: 30, blue: 34)
        }
    }
    
    static let gray9 = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 225, green: 225, blue: 229)
        } else {
            return colorFromRGB(red: 82, green: 82, blue: 86)
        }
    }
    
    static let placeholder = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 168, green: 168, blue: 172)
        } else {
            return colorFromRGB(red: 126, green: 126, blue: 130)
        }
    }
    
    static let border = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 229, green: 229, blue: 233)
        } else {
            return colorFromRGB(red: 44, green: 44, blue: 48)
        }
    }
    
    static let defaultPictureTint = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return colorFromRGB(red: 144, green: 144, blue: 148)
        } else {
            return colorFromRGB(red: 182, green: 182, blue: 186)
        }
    }
    
}
