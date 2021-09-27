//
//  RectangleService.swift
//  Rectangles
//
//  Created by indraneel potnis on 25/09/21.
//

import Foundation
import UIKit

class RectangleService {
    
    func getRectangles(completionHandler: @escaping (Result<[Rectangle], Error>) -> Void) {
        
    }
    
    func parseJsonData(data: Data) throws ->  [Rectangle] {
     
        var rectangles = [Rectangle]()
     
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
     
            // Parse JSON data
            let rectangleList = jsonResult?["rectangles"] as! [AnyObject]
            for singleRectangle in rectangleList {
              
                let x = singleRectangle["x"] as! Double
                let y = singleRectangle["y"] as! Double
                let size = singleRectangle["size"] as! Double
                let rectangle = Rectangle(x: CGFloat(x), y:  CGFloat(y), size: CGFloat(size))
                
                rectangles.append(rectangle)
            }
        }
     
        return rectangles
    }
}
