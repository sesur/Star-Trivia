import XCTest
@testable import StarTrivia

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
        XCTAssertNotNil(makeSUT().homeWorldButton, "homeWorldButton")
        XCTAssertNotNil(makeSUT().vehiclesButton, "vehiclesButton")
        XCTAssertNotNil(makeSUT().starshipsButton, "starshipsButton")
        XCTAssertNotNil(makeSUT().filmsButton, "filmsButton")
    }
    
    func test_buttons_buttonTape_shouldTape() {
        XCTAssertNotNil(tap(makeSUT().randomButton))
        XCTAssertNotNil(tap(makeSUT().homeWorldButton))
        XCTAssertNotNil(tap(makeSUT().vehiclesButton))
        XCTAssertNotNil(tap(makeSUT().starshipsButton))
        XCTAssertNotNil(tap(makeSUT().filmsButton))
    }
    
    //MARK:- Helpers
    private func makeSUT() -> HomeController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: HomeController = sb.instantiateViewController(identifier: String(describing: HomeController.self))
        
        sut.loadViewIfNeeded()
        
        return sut
    }
}
