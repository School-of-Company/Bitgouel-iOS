import XCTest

class TargetTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
//        XCTAssertEqual("A", "A")
        XCTAssertEqual(2 + 2, 4, "2 + 2 should equal 4")
                
        XCTAssertTrue(true, "This should always be true")
                
        XCTAssertFalse(false, "This should always be false")
    }
}
