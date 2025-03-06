//
//  UIHelper.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li
//

import UIKit

class UIHelper {
    
    static func getSceneDelegate() -> SceneDelegate? {
        return UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
    }
    
    static func setRootViewController(_ viewController: UIViewController) {
        getSceneDelegate()?.window?.rootViewController = nil
        getSceneDelegate()?.window?.rootViewController = viewController
    }
    
    static func getKeyWindow() -> UIWindow? {
        return UIApplication.shared.connectedScenes.compactMap { ($0 as? UIWindowScene)?.keyWindow }.last
    }
    
    static func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    static func getSafeAreaTopPadding() -> CGFloat? {
        return getKeyWindow()?.safeAreaInsets.top
    }
    
    static func getSafeAreaBottomPadding() -> CGFloat? {
        return getKeyWindow()?.safeAreaInsets.bottom
    }
    
    static func getKeyboardHeight(_ notification: Notification) -> CGFloat? {
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        return keyboardFrame?.cgRectValue.height
    }
    
}
