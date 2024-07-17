//
//  LocalUserHelper.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import Foundation

class LocalUserHelper {
    
    static let isUserLoggedInKey = "IsUserLoggedIn"
    
    static func logIn() {
        UserDefaults.standard.set(true, forKey: isUserLoggedInKey)
    }
    
    static func logOut() {
        UserDefaults.standard.set(false, forKey: isUserLoggedInKey)
    }
    
    static func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: isUserLoggedInKey)
    }
    
}
