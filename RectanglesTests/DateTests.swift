//
//  DateTests.swift
//  RectanglesTests
//
//  Created by indraneel potnis on 26/09/21.
//

import XCTest
@testable import Rectangles

class DateTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLessThanAWeek() throws {
        let Dateformatter = DateFormatter()

        Dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        //convert string to date

        let dateold = Dateformatter.date(from: "2021-09-19T14:20:20.000Z")!
        let dateNew = Dateformatter.date(from: "2021-09-26T14:20:19.000Z")!
        
        XCTAssertFalse(DateUtils.hasAWeekPassed(to: dateNew, from: dateold ))
    }
    
    func testMoreThanAWeek() throws {
        let Dateformatter = DateFormatter()

        Dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        //convert string to date
        let dateold = Dateformatter.date(from: "2021-09-19T14:20:20.000Z")!
        let dateNew = Dateformatter.date(from: "2021-09-26T14:20:21.000Z")!
        
        XCTAssertTrue(DateUtils.hasAWeekPassed(to: dateNew, from: dateold ))
    }

    func testExactlyEqualToAWeek() throws {
        let Dateformatter = DateFormatter()

        Dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        //convert string to date
        let dateold = Dateformatter.date(from: "2021-09-19T14:20:20.000Z")!
        let dateNew = Dateformatter.date(from: "2021-09-26T14:20:20.000Z")!
        
        XCTAssertFalse(DateUtils.hasAWeekPassed(to: dateNew, from: dateold ))
    }

}
