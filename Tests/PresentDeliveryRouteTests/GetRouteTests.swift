import XCTest
@testable import PresentDeliveryRoute

//Search should produce a delivery route
//- Input: List of cities
//- Output: Delivery route

final class GetRouteTests: XCTestCase {
    func testSearchReturnsListOfCities() {
        let testCity = City(1)
        let mockNextBestCityMethod: NextBestCityMethod = { _, _ in
            return City(1)
        }
        XCTAssertEqual(getRoute([testCity], nextBestCityMethod: mockNextBestCityMethod), [testCity])
    }

    func testRouteBeginsAtLargestCity() {
        let smallCity = City(1)
        let bigCity = City(2)
        let cities = [smallCity, bigCity]
        let mockNextBestCityMethod: NextBestCityMethod = { _, _ in
            return City(1)
        }
        XCTAssertEqual(getRoute(cities, nextBestCityMethod: mockNextBestCityMethod)[0], bigCity)
    }

    func testSecondStopOnRouteIsNextBestStop() {
        let biggestCity = City(3)
        let bestCity = City(1)
        let worstCity = City(2)
        let cities = [worstCity, bestCity, biggestCity]
        let mockNextBestCityMethod: NextBestCityMethod = { _, _ in
            return bestCity
        }

        XCTAssertEqual(getRoute(cities, nextBestCityMethod: mockNextBestCityMethod)[1], bestCity)
    }
}
