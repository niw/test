import XCTest
@testable import SwiftPackageTest

final class TestTest: XCTestCase {
    func testTest() {
        let view = MyTestView()
        XCTAssertEqual(view.name, "nyan")
    }
}
