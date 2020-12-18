import XCTest
@testable import PresentDeliveryRoute

//Search should produce a delivery route
//- Input: List of cities
//- Output: Delivery route

final class PresentDeliveryRouteTests: XCTestCase {
    func testSearchReturnsListOfCities() {
        let testCity = City(1)
        XCTAssertEqual(getRoute([testCity]), [testCity])
    }

    func testRouteBeginsAtLargestCity() {
        let smallCity = City(1)
        let bigCity = City(2)
        let cities = [smallCity, bigCity]
        XCTAssertEqual(getRoute(cities)[0], bigCity)
    }
}
