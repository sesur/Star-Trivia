//
//  VehicleViewControllerTests.swift
//  Star_TriviaUnitTests
//
//  Created by Sergiu on 05.09.2021.
//  Copyright © 2021 Sergiu. All rights reserved.
//

import XCTest
@testable import StarTrivia

class VehicleViewControllerTests: XCTestCase {
    
    func test_viewDidLoad() {
        XCTAssertNotNil(makeSUT, "viewDidLoad")
    }
    
    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(makeSUT().name, "name")
        XCTAssertNotNil(makeSUT().model, "model")
        XCTAssertNotNil(makeSUT().length, "length")
        XCTAssertNotNil(makeSUT().maker, "maker")
        XCTAssertNotNil(makeSUT().cost, "cost")
        XCTAssertNotNil(makeSUT().speed, "speed")
        XCTAssertNotNil(makeSUT().crew, "crew")
        XCTAssertNotNil(makeSUT().passenger, "passenger")
        XCTAssertNotNil(makeSUT().previewButton, "previewButton")
        XCTAssertNotNil(makeSUT().nextButton, "nextButton")
        XCTAssertNotNil(makeSUT().spinner, "spinner")
        
    }
    
    //MARK:- Helpers
    private func makeSUT() -> VehicleViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: VehicleViewController = sb.instantiateViewController(identifier: String(describing: VehicleViewController.self))
        
        sut.loadViewIfNeeded()
        
        return sut
    }
}
