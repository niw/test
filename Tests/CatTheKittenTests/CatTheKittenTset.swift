import XCTest
@testable import CatTheKitten

final class CatTheKittenTest: XCTestCase {
    func testName() {
        let view = CatTheKittenView()
        XCTAssertEqual(view.name, "CatTheKitten")
    }
}
