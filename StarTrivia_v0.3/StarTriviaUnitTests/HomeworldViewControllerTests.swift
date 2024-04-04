import XCTest
@testable import StarTrivia

class HomeworldViewControllerTests: XCTestCase {
    
    func test_viewDidLoad() {
        XCTAssertNotNil(makeSUT(), "viewDidLoad")
    }
    
    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(makeSUT().name, "name")
        XCTAssertNotNil(makeSUT().climate, "climate")
        XCTAssertNotNil(makeSUT().terrain, "terrain")
        XCTAssertNotNil(makeSUT().population, "population")
        XCTAssertNotNil(makeSUT().spinner, "spinner")
    }
    
    //MARK:- Helpers
    func makeSUT() -> HomeworldViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: HomeworldViewController = sb.instantiateViewController(identifier: String(describing: HomeworldViewController.self))
        
        sut.loadViewIfNeeded()
        
        return sut
    }
}
