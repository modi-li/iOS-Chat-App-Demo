//
//  OSHelper.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class OSHelper {
    
    static func getSceneDelegate() -> SceneDelegate? {
        return UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
    }
    
    static func setRootViewController(_ viewController: UIViewController) {
        getSceneDelegate()?.window?.rootViewController = viewController
    }
    
    static func getKeyWindow() -> UIWindow? {
        return UIApplication.shared.connectedScenes.compactMap { ($0 as? UIWindowScene)?.keyWindow }.last
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
