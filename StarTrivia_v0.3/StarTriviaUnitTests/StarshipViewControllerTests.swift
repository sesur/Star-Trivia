//
//  StarshipViewControllerTests.swift
//  Star_TriviaUnitTests
//
//  Created by Sergiu on 06.09.2021.
//  Copyright © 2021 Sergiu. All rights reserved.
//

import XCTest
@testable import StarTrivia

class StarshipViewControllerTests: XCTestCase {
    
    func test_viewDidLoad() {
     XCTAssertNotNil(makeSUT(), "viewDidLoad")
    }
    
    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(makeSUT().name, "name")
        XCTAssertNotNil(makeSUT().model, "model")
        XCTAssertNotNil(makeSUT().length, "lenght")
        XCTAssertNotNil(makeSUT().maker, "maker")
        XCTAssertNotNil(makeSUT().cost, "cost")
        XCTAssertNotNil(makeSUT().speed, "speed")
        XCTAssertNotNil(makeSUT().crew, "crew")
        XCTAssertNotNil(makeSUT().passengers, "passengers")
        XCTAssertNotNil(makeSUT().spinner, "spinner")
    }
    
    //MARK:- Helpers
    func makeSUT() -> StarshipViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: StarshipViewController = sb.instantiateViewController(identifier: String(describing: StarshipViewController.self))
        
        sut.loadViewIfNeeded()
        
        return sut
    }
}
