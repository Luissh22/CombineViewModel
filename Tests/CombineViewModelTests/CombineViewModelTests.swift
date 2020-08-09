import XCTest
@testable import CombineViewModel

final class CombineViewModelTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CombineViewModel().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
