import XCTest
@testable import StarTrivia

class FilmViewControllerTests: XCTestCase {
    
    func test_viewDidLoad() {
        XCTAssertNotNil(makeSUT(), "viewDidLoad")
    }
    
    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(makeSUT().previewFilm, "previewFilm")
        XCTAssertNotNil(makeSUT().nextFilm, "nextFilm")
        XCTAssertNotNil(makeSUT().released, "released")
        XCTAssertNotNil(makeSUT().producer, "producer")
        XCTAssertNotNil(makeSUT().director, "director")
        XCTAssertNotNil(makeSUT().episode, "episode")
        XCTAssertNotNil(makeSUT().filmTitle, "filmTitle")
        XCTAssertNotNil(makeSUT().crowl, "crowl")
        XCTAssertNotNil(makeSUT().spinner, "spinner")
    }
    
    //MARK:- Helpers
    func makeSUT() -> FilmViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: FilmViewController = sb.instantiateViewController(identifier: String(describing: FilmViewController.self))
        
        sut.loadViewIfNeeded()
        return sut
    }
 
}
