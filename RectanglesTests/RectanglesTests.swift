//
//  RectanglesTests.swift
//  RectanglesTests
//
//  Created by indraneel potnis on 22/09/21.
//

import XCTest
@testable import Rectangles

class RectanglesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadRectangleDataFromDefaults()  throws  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(identifier: "ViewController", creator: { coder -> ViewController? in
            ViewController(coder: coder, userDefaultsUtils: UserDefaultsUtilsMockWithData(), api : RectangleServiceMockWithError())
            }
        )
        vc.userDefaultsUtils = UserDefaultsUtilsMockWithData()
        vc.loadViewIfNeeded()
        XCTAssertEqual(vc.view.subviews.count, 3)
    }
    
    func testLoadRectangleDataFromApi()  throws  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(identifier: "ViewController", creator: { coder -> ViewController? in
            ViewController(coder: coder, userDefaultsUtils: UserDefaultsUtilsMockWithNil(), api : RectangleServiceMockWithData())
            }
        )
        vc.userDefaultsUtils = UserDefaultsUtilsMockWithNil()
        vc.loadViewIfNeeded()
        let expectation = XCTestExpectation(description: "wait")
        XCTWaiter.wait(for: [expectation], timeout: 0.5)
        XCTAssertEqual(vc.view.subviews.count, 2)
    }
    
    func testLoadRectangleDataFromApiWithError()  throws  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(identifier: "ViewController", creator: { coder -> ViewController? in
            ViewController(coder: coder, userDefaultsUtils: UserDefaultsUtilsMockWithNil(), api : RectangleServiceMockWithError())
            }
        )
        
        vc.userDefaultsUtils = UserDefaultsUtilsMockWithNil()
        vc.api = RectangleServiceMockWithError()
        vc.loadViewIfNeeded()
        let expectation = XCTestExpectation(description: "wait")
        XCTWaiter.wait(for: [expectation], timeout: 2)
        XCTAssertEqual(vc.view.subviews.count, 0)
    }

    func testLoadRectangleDataFromDefaultsValue()  throws  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(identifier: "ViewController", creator: { coder -> ViewController? in
            ViewController(coder: coder, userDefaultsUtils: UserDefaultsUtilsMockWithData(), api : RectangleServiceMockWithError())
            }
        )
        
        vc.userDefaultsUtils = UserDefaultsUtilsMockWithData()
        vc.loadViewIfNeeded()
        XCTAssertEqual(vc.rectangles.first!.x, 0.3, accuracy: 0.01)
        XCTAssertEqual(vc.rectangles.first!.y, 0.3, accuracy: 0.01)
        XCTAssertEqual(vc.rectangles.first!.size, 0.15, accuracy: 0.01)
    }
    
    func testLoadRectangleDataFromApiValue()  throws  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(identifier: "ViewController", creator: { coder -> ViewController? in
            ViewController(coder: coder, userDefaultsUtils: UserDefaultsUtilsMockWithNil(), api : RectangleServiceMockWithData())
            }
        )
 
        vc.loadViewIfNeeded()
        XCTAssertEqual(vc.rectangles.first!.x, 0.5, accuracy: 0.01)
        XCTAssertEqual(vc.rectangles.first!.y, 0.5, accuracy: 0.01)
        XCTAssertEqual(vc.rectangles.first!.size, 0.2, accuracy: 0.01)
    }
    
}
