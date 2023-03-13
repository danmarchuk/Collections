//
//  Collections_UITests.swift
//  Collections_UITests
//
//  Created by Данік on 11/03/2023.
//

import XCTest

final class Collections_UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()

        let array = app.staticTexts["Array"]
        XCTAssertTrue(array.exists)
        array.tap()

        let collectionViewsQuery = app.collectionViews
        
        let cell_0 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_0")
        XCTAssertTrue(cell_0.exists)
        cell_0.tap()
        
        let cell_1_expectation = expectation(for: NSPredicate(format: "exists == true"), evaluatedWith: collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_1"), handler: nil)
        wait(for: [cell_1_expectation], timeout: 5)
        
        let cell_1 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_1")
        XCTAssertTrue(cell_1.exists)
        cell_1.tap()
        
        let cell_2 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_2")
        XCTAssertTrue(cell_2.exists)
        cell_2.tap()
        
        let cell_3 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_3")
        XCTAssertTrue(cell_3.exists)
        cell_3.tap()
        
        let cell_4 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_4")
        XCTAssertTrue(cell_4.exists)
        cell_4.tap()
        
        let cell_5 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_5")
        XCTAssertTrue(cell_5.exists)
        cell_5.tap()
        
        let cell_6 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_6")
        XCTAssertTrue(cell_6.exists)
        cell_6.tap()
        
        let cell_7 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_7")
        XCTAssertTrue(cell_7.exists)
        cell_7.tap()
        
        let cell_8 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_8")
        XCTAssertTrue(cell_8.exists)
        cell_8.tap()
        
        let cell_9 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_9")
        XCTAssertTrue(cell_9.exists)
        cell_9.tap()
        
        let cell_10 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_10")
        XCTAssertTrue(cell_10.exists)
        cell_10.tap()
        
        let cell_11 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_11")
        XCTAssertTrue(cell_11.exists)
        cell_11.tap()
        
        let menuButton = app.navigationBars.buttons["Menu"]
        XCTAssertTrue(menuButton.exists)
        menuButton.tap()
        
        // MARK: - SetTesting
        
        let set = app.staticTexts["Set"]
        set.tap()
        
        let textField1 = app.textFields.element(matching: .any, identifier: "TextField1")
        XCTAssertTrue(textField1.exists)
        textField1.tap()
        textField1.typeText("Qwerty")
        
        let textField2 = app.textFields.element(matching: .any, identifier: "TextField2")
        XCTAssertTrue(textField2.exists)
        textField2.tap()
        textField2.typeText("Qazr")
        
        let button1 = app.buttons.element(matching: .any, identifier: "Button1")
        XCTAssertTrue(button1.exists)
        button1.tap()
        
        let label1 = app.staticTexts.element(matching: .any, identifier: "Label1")
        XCTAssertTrue(label1.exists)
        XCTAssertTrue(label1.label.contains("Qr"))
        
        let button2 = app.buttons.element(matching: .any, identifier: "Button2")
        XCTAssertTrue(button2.exists)
        button2.tap()
        
        let label2 = app.staticTexts.element(matching: .any, identifier: "Label2")
        XCTAssertTrue(label2.exists)
        XCTAssertTrue(label2.label.contains("waezty"))
        
        let button3 = app.buttons.element(matching: .any, identifier: "Button3")
        XCTAssertTrue(button3.exists)
        button3.tap()
        
        let label3 = app.staticTexts.element(matching: .any, identifier: "Label3")
        XCTAssertTrue(label3.exists)
        XCTAssertTrue(label3.label.contains("wety"))
        
        menuButton.tap()
        
        // MARK: - Dictionary Tests
        let dict = app.staticTexts["Dictionary"]
        dict.tap()
        
        let cell_00 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_0")
        XCTAssertTrue(cell_00.exists)
        cell_00.tap()
        
        let cell_01 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_1")
        XCTAssertTrue(cell_01.exists)
        cell_01.tap()
        
        let cell_02 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_2")
        XCTAssertTrue(cell_02.exists)
        cell_02.tap()
        
        let cell_03 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_3")
        XCTAssertTrue(cell_03.exists)
        cell_03.tap()
        
        let cell_04 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_4")
        XCTAssertTrue(cell_04.exists)
        cell_04.tap()
        
        let cell_05 = collectionViewsQuery.cells.element(matching: .cell, identifier: "Cell_5")
        XCTAssertTrue(cell_05.exists)
        cell_05.tap()
        
        
        
        
        
        
        
        
        
        
        
        
//
//
//
//
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Insert 1000 elements at the end of the array."]/*[[".cells.staticTexts[\"Insert 1000 elements at the end of the array.\"]",".staticTexts[\"Insert 1000 elements at the end of the array.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Remove 1000 elements at the end of the array one by-one."]/*[[".cells.staticTexts[\"Remove 1000 elements at the end of the array one by-one.\"]",".staticTexts[\"Remove 1000 elements at the end of the array one by-one.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Remove 1000 elements at the end of the array."]/*[[".cells.staticTexts[\"Remove 1000 elements at the end of the array.\"]",".staticTexts[\"Remove 1000 elements at the end of the array.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Array 56898u998"].buttons["Menu"].tap()
//        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Dictionary"]/*[[".cells.staticTexts[\"Dictionary\"]",".staticTexts[\"Dictionary\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).staticTexts["Find the first contact"].tap()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Find the first contact"]/*[[".cells.staticTexts[\"Find the first contact\"]",".staticTexts[\"Find the first contact\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).staticTexts["Find the last contact"].tap()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Find the last contact"]/*[[".cells.staticTexts[\"Find the last contact\"]",".staticTexts[\"Find the last contact\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery.children(matching: .cell).element(boundBy: 4).staticTexts["Search for a non-existing element"].tap()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Search for a non-existing element"]/*[[".cells.staticTexts[\"Search for a non-existing element\"]",".staticTexts[\"Search for a non-existing element\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Dictionary 777"].buttons["Menu"].tap()
//
//
//
//
//
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
