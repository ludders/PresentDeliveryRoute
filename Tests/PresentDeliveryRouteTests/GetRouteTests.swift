import XCTest
@testable import PresentDeliveryRoute

//Search should produce a delivery route
//- Input: List of cities
//- Output: Delivery route

final class GetRouteTests: XCTestCase {
    let mockMetric: PresentDeliveryMetric = MockPresentDeliveryMetric()

    func testSearchReturnsListOfCities() {
        let testCity = City(1, location: CLLocation(latitude: 0, longitude: 0))
        let mockRule = MockNextBestCityRule(returns: City(1, location: CLLocation(latitude: 0, longitude: 0)))
        let route = getRoute([testCity], using: mockRule, metric: mockMetric)
        XCTAssertEqual(route, [testCity])
    }

    func testRouteBeginsAtLargestCity() {
        let smallCity = City(1, location: CLLocation(latitude: 0, longitude: 0))
        let bigCity = City(2, location: CLLocation(latitude: 0, longitude: 0))
        let cities = [smallCity, bigCity]
        let mockRule = MockNextBestCityRule(returns: City(1, location: CLLocation(latitude: 0, longitude: 0)))
        let route = getRoute(cities, using: mockRule, metric: mockMetric)
        XCTAssertEqual(route[0], bigCity)
    }

    func testSecondStopOnRouteIsNextBestStop() {
        let biggestCity = City(3, location: CLLocation(latitude: 0, longitude: 0))
        let bestCity = City(1, location: CLLocation(latitude: 0, longitude: 0))
        let worstCity = City(2, location: CLLocation(latitude: 0, longitude: 0))
        let cities = [worstCity, bestCity, biggestCity]
        let mockRule = MockNextBestCityRule(returns: bestCity)
        let route = getRoute(cities, using: mockRule, metric: mockMetric)
        XCTAssertEqual(route[1], bestCity)
    }
}

class MockNextBestCityRule: NextBestCityRuleProtocol {
    var bestCity: City

    init(returns bestCity: City) {
        self.bestCity = bestCity
    }

    func nextBestCity(from: City, to: [City], using: PresentDeliveryMetric) -> City {
        return bestCity
    }
}
