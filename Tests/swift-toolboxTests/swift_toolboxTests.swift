import XCTest
@testable import swift_toolbox

final class swift_toolboxTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_toolbox().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
