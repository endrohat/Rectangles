//
//  Rectangle.swift
//  Rectangles
//
//  Created by indraneel potnis on 22/09/21.
//

import Foundation
import UIKit

class Rectangle : Codable, CustomStringConvertible {
    lazy var description: String = "rect [ \(x) and \(y) and \(size) ]"
    
    var x : CGFloat
    var y : CGFloat
    var size : CGFloat
    
    init(x : CGFloat, y : CGFloat, size : CGFloat) {
        self.x = x
        self.y = y
        self.size = size
    }
}
