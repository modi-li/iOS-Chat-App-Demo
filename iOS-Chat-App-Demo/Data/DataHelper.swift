//
//  DataHelper.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li
//

import UIKit
import CoreData

class DataHelper {
    
    static func getContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    static func getSelfUser() -> SelfUserManager? {
        let request = SelfUserManager.fetchRequest()
        do {
            return try getContext().fetch(request)[0]
        } catch {
            return nil
        }
    }
    
}
