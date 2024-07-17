//
//  DataHelper.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit
import CoreData

class DataHelper {
    
    static func getContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    static func getSelfUser() -> SelfUser? {
        let request = SelfUser.fetchRequest()
        do {
            let selfUser = try getContext().fetch(request)[0]
            return selfUser
        } catch {
            return nil
        }
    }
    
}
