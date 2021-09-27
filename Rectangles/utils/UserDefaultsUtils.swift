//
//  UserDefaultsUtils.swift
//  Rectangles
//
//  Created by indraneel potnis on 27/09/21.
//

import Foundation

class UserDefaultsUtils {
    func saveData(rectangles : [Rectangle]) {
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(rectangles, forKey: "rectangles")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadData() -> Array<Rectangle>? {
        let userDefaults = UserDefaults.standard
        do {
            let rectangleData = try userDefaults.getObject(forKey: "rectangles", castTo: Array<Rectangle>.self)
         
            return rectangleData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func saveLastUsedDate(date : Date) {
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(date, forKey: "lastUsedDate")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadLastUsedDate() -> Date? {
        let userDefaults = UserDefaults.standard
        do {
            let lastUsedDate = try userDefaults.getObject(forKey: "lastUsedDate", castTo: Date.self)
            return lastUsedDate
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
