//
//  iTest2UITests.swift
//  iTest2UITests
//
//  Created by Tatiana Cooper on 28/01/2022.
//

import XCTest

class iTest2UITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testElementsTree () throws {
        print(app.debugDescription)
    }

    
    func testNavigationBarExists() throws {
        let navBar = app.navigationBars.element
        XCTAssert(navBar.exists)
    }
    
    func testListExists () {
        let photosList = app.tables[LIST_ACCESSIBILITY_ID]
        XCTAssert(photosList.exists)
       
    }
    
    func testListCellsCount () {
        let photosList = app.tables[LIST_ACCESSIBILITY_ID]
        XCTAssertEqual(photosList.cells.count, 11)
    }
    
    
    

}
