//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {
    
    var app:XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testTappingOnNonEmptySpace() {
        app.buttons["Relaunch"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .button).element(boundBy: 0).tap()
        app.buttons["ticTacToe x"].tap()
        
        let elementsQuery = app.alerts["Alert"].scrollViews.otherElements
        elementsQuery.staticTexts["This spot is already taken, please choose another one."].tap()
        elementsQuery.buttons["Ok"].tap()
    }
    
    func testHorizontalWin() {
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element(boundBy: 0).children(matching: .button).element(boundBy: 0).tap()
        
        let element2 = element.children(matching: .other).element(boundBy: 2)
        element2.children(matching: .button).element(boundBy: 1).tap()
        element2.children(matching: .button).element(boundBy: 0).tap()
        
        let element3 = element.children(matching: .other).element(boundBy: 4)
        element3.children(matching: .button).element(boundBy: 1).tap()
        element3.children(matching: .button).element(boundBy: 0).tap()
        app.alerts["Congratulations"].scrollViews.otherElements.buttons["Ok"].tap()
    }
    
    func testVerticalWin() {
        let element3 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element3.children(matching: .other).element(boundBy: 0)
        element.children(matching: .button).element(boundBy: 0).tap()
        
        let element2 = element3.children(matching: .other).element(boundBy: 2)
        element2.children(matching: .button).element(boundBy: 0).tap()
        element.children(matching: .button).element(boundBy: 1).tap()
        element2.children(matching: .button).element(boundBy: 1).tap()
        element.children(matching: .button).element(boundBy: 2).tap()
        app.alerts["Congratulations"].scrollViews.otherElements.buttons["Ok"].tap()
    }
    
    func testDiagonalWin() {
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element(boundBy: 0).children(matching: .button).element(boundBy: 0).tap()
        
        let element2 = element.children(matching: .other).element(boundBy: 2)
        element2.children(matching: .button).element(boundBy: 0).tap()
        element2.children(matching: .button).element(boundBy: 1).tap()
        
        let element3 = element.children(matching: .other).element(boundBy: 4)
        element3.children(matching: .button).element(boundBy: 1).tap()
        element3.children(matching: .button).element(boundBy: 2).tap()
        app.alerts["Congratulations"].scrollViews.otherElements.buttons["Ok"].tap()
    }
    
    func testDraw() {
        let app = XCUIApplication()
        let element4 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element4.children(matching: .other).element(boundBy: 0)
        element.children(matching: .button).element(boundBy: 0).tap()
        
        let element2 = element4.children(matching: .other).element(boundBy: 2)
        element2.children(matching: .button).element(boundBy: 0).tap()
        
        let element3 = element4.children(matching: .other).element(boundBy: 4)
        element3.children(matching: .button).element(boundBy: 0).tap()
        element.children(matching: .button).element(boundBy: 2).tap()
        element2.children(matching: .button).element(boundBy: 2).tap()
        element3.children(matching: .button).element(boundBy: 2).tap()
        element2.children(matching: .button).element(boundBy: 1).tap()
        element3.children(matching: .button).element(boundBy: 1).tap()
        element.children(matching: .button).element(boundBy: 1).tap()
        
        let elementsQuery = app.alerts["Game over"].scrollViews.otherElements
        elementsQuery.staticTexts["This game is a draw."].tap()
        elementsQuery.buttons["Ok"].tap()
    }
    
    func testRelaunch() {
        
        let app = XCUIApplication()
        let relaunchButton = app.buttons["Relaunch"]
        relaunchButton.tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let button = element.children(matching: .other).element(boundBy: 0).children(matching: .button).element(boundBy: 0)
        button.tap()
        app.buttons["ticTacToe x"].tap()
        app.alerts["Alert"].scrollViews.otherElements.buttons["Ok"].tap()
        relaunchButton.tap()
        button.tap()
        element.children(matching: .other).element(boundBy: 2).children(matching: .button).element(boundBy: 0).tap()


    }
    
    func testNameChangeOnTurn() {
        let app = XCUIApplication()
        app.staticTexts["Player X"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .button).element(boundBy: 0).tap()
        app.staticTexts["Player O"].tap()
    }
}
