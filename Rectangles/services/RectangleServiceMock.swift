//
//  RectangleServiceMock.swift
//  Rectangles
//
//  Created by indraneel potnis on 25/09/21.
//

import Foundation
import UIKit

class RectangleServiceMockWithData : RectangleService {
    private let rectanglesFileName = "rectangles"
    
    override
    func getRectangles(completionHandler: @escaping (Result<[Rectangle], Error>) -> Void) {
        if let rectanglesFilePath = Bundle.main.path(forResource: rectanglesFileName, ofType: "json") {
            do {
                let rectData = try Data(contentsOf: URL(fileURLWithPath: rectanglesFilePath), options: .mappedIfSafe)
                let jsonData = try parseJsonData(data: rectData)
                return completionHandler(.success(jsonData))
            } catch {
                print(error)
                completionHandler(.failure(error))
            }
        } else {
            print("Missing rectangles.json file.")
            completionHandler(.failure(NSError(domain: "com.indra", code: 0, userInfo: [NSLocalizedDescriptionKey: "Missing rectangles.json file."])))
        }
    }
}

class RectangleServiceMockWithError : RectangleService {
    override
    func getRectangles(completionHandler: @escaping (Result<[Rectangle], Error>) -> Void) {
        completionHandler(.failure(NSError(domain: "com.indra", code: 0, userInfo: [NSLocalizedDescriptionKey: "Mock Error."])))
    }
}
