import XCTest
@testable import PresentDeliveryRoute

//Search should produce a delivery route
//- Input: List of cities
//- Output: Delivery route

final class GetRouteTests: XCTestCase {
    let fakeMetric = FakePresentDeliveryMetric()
    let stubLocation = Stubs.locations.zero

    func testSearchReturnsListOfCities() {
        let testCity = FakeMetricCity(city: Stubs.cities.city, metricValue: 1)
        let fakeRule = FakeNextBestCityRule()
        let route = getRoute([testCity], using: fakeRule)
        XCTAssertEqual(route, [testCity])
    }

    func testRouteBeginsAtLargestCity() {
        let smallCity = FakeMetricCity(city: Stubs.cities.city, metricValue: 1)
        let bigCity = FakeMetricCity(city: Stubs.cities.biggerCity, metricValue: 1)
        let cities = [smallCity, bigCity]
        let fakeRule = FakeNextBestCityRule()
        let route = getRoute(cities, using: fakeRule)
        XCTAssertEqual(route[0], bigCity)
    }

    func testGetRouteForThreeCitiesReturnsEfficientRouteBasedOnFakeMetric() {
        let chicago = FakeMetricCity(city: Stubs.cities.chicago, metricValue: 2)
        let losAngeles = FakeMetricCity(city: Stubs.cities.losAngeles, metricValue: 1)
        let newYork = FakeMetricCity(city: Stubs.cities.newYork, metricValue: 0)
        let cities = [chicago, losAngeles, newYork]
        let fakeRule = FakeNextBestCityRule()
        let route = getRoute(cities, using: fakeRule)
        XCTAssertEqual(route, [newYork, chicago, losAngeles])
    }
}

class FakeNextBestCityRule: NextBestCityRuleProtocol {
    var metric = FakePresentDeliveryMetric()
    func nextBestCity(from: City, to cities: [City]) -> City {
        guard let mockCities = cities as? [FakeMetricCity] else {
            fatalError("Only an array of FakeMetricCity can be used here.")
        }
        return mockCities.max { (city1, city2) -> Bool in
            return city1.fakeMetric < city2.fakeMetric
        }!
    }
}

class FakeMetricCity: City {
    var fakeMetric: Double

    init(_ name: String, population: Int, location: CLLocation, metricValue: Double) {
        self.fakeMetric = metricValue
        super.init(name, population: population, location: location)
    }

    convenience init(city: City, metricValue: Double) {
        self.init(city.name, population: city.population, location: city.location, metricValue: metricValue)
    }
}
