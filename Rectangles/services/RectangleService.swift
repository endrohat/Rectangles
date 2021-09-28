//
//  RectangleService.swift
//  Rectangles
//
//  Created by indraneel potnis on 25/09/21.
//

import Foundation
import UIKit

class RectangleService {
    
    private let restURL = "https://domain.com/resourcer/v1/rectangles"
    
    func getRectangles(completionHandler: @escaping (Result<[Rectangle], Error>) -> Void) {
        let url = URL(string: restURL)!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(NSError(domain: "com.indra", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let jsonData = try self.parseJsonData(data: data)
                return completionHandler(.success(jsonData))
            } catch {
                print(error)
                completionHandler(.failure(error))
            }
        }

        task.resume()
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
