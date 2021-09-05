//
//  HomeControllerTests.swift
//  Star TriviaUnitTests
//
//  Created by Sergiu on 05.09.2021.
//  Copyright © 2021 Sergiu. All rights reserved.
//

import XCTest
@testable import Star_Trivia

class HomeControllerTests: XCTestCase {
    
    func test_viewDidLoad() {
       XCTAssertNotNil(makeSUT, "viewDidLoad")
    }
    
    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(makeSUT().name, "name")
        XCTAssertNotNil(makeSUT().height, "height")
        XCTAssertNotNil(makeSUT().mass, "mass")
        XCTAssertNotNil(makeSUT().hair, "hair")
        XCTAssertNotNil(makeSUT().birthYear, "birthYear")
        XCTAssertNotNil(makeSUT().gender, "gender")
        XCTAssertNotNil(makeSUT().spinner, "spinner")
        XCTAssertNotNil(makeSUT().homeWorldLabel, "homeWorldLabel")
        XCTAssertNotNil(makeSUT().vehiclesLabel, "vehiclesLabel")
        XCTAssertNotNil(makeSUT().starshipsLabel, "starshipsLabel")
        XCTAssertNotNil(makeSUT().filmsLabel, "filmsLabel")
    }
    
    //MARK:- Helpers
    private func makeSUT() -> HomeController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: HomeController = sb.instantiateViewController(identifier: String(describing: HomeController.self))
        
        sut.loadViewIfNeeded()
        
        return sut
    }
}

