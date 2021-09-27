//
//  UserDefaultsUtilsMock.swift
//  Rectangles
//
//  Created by indraneel potnis on 27/09/21.
//

import Foundation
class UserDefaultsUtilsMockWithData : UserDefaultsUtils {
    override
    func saveData(rectangles : [Rectangle]) {
        
    }
    
    override
    func loadData() -> Array<Rectangle>? {
        var rects : [Rectangle] = []
        rects.append(Rectangle(x: 0.3, y: 0.3, size: 0.15))
        rects.append(Rectangle(x: 0.2, y: 0.3, size: 0.3))
        rects.append(Rectangle(x: 0.4, y: 0.1, size: 0.4))
        return rects
    }
}

class UserDefaultsUtilsMockWithNil : UserDefaultsUtils {
    override
    func saveData(rectangles : [Rectangle]) {
        
    }
    
    override
    func loadData() -> Array<Rectangle>? {
        return nil
    }
}
