import XCTest
@testable import PresentDeliveryRoute

//Search should produce a delivery route
//- Input: List of cities
//- Output: Delivery route

final class GetRouteTests: XCTestCase {
    let fakeMetric: PresentDeliveryMetric = FakePresentDeliveryMetric()
    let stubLocation = Stubs.locations.zero

    func testSearchReturnsListOfCities() {
        let testCity = FakeMetricCity(1, location: stubLocation, metricValue: 1)
        let fakeRule = FakeNextBestCityRule()
        let route = getRoute([testCity], using: fakeRule, metric: fakeMetric)
        XCTAssertEqual(route, [testCity])
    }

    func testRouteBeginsAtLargestCity() {
        let smallCity = FakeMetricCity(1, location: stubLocation, metricValue: 1)
        let bigCity = FakeMetricCity(2, location: stubLocation, metricValue: 1)
        let cities = [smallCity, bigCity]
        let fakeRule = FakeNextBestCityRule()
        let route = getRoute(cities, using: fakeRule, metric: fakeMetric)
        XCTAssertEqual(route[0], bigCity)
    }

    func testGetRouteForThreeCitiesReturnsEfficientRouteBasedOnFakeMetric() {
        let chicago = FakeMetricCity(city: Stubs.cities.chicago, metricValue: 2)
        let losAngeles = FakeMetricCity(city: Stubs.cities.losAngeles, metricValue: 1)
        let newYork = FakeMetricCity(city: Stubs.cities.newYork, metricValue: 0)
        let cities = [chicago, losAngeles, newYork]
        let fakeRule = FakeNextBestCityRule()
        let route = getRoute(cities, using: fakeRule, metric: fakeMetric)
        XCTAssertEqual(route, [newYork, chicago, losAngeles])
    }
}

class FakeNextBestCityRule: NextBestCityRuleProtocol {
    func nextBestCity(from: City, to cities: [City], using: PresentDeliveryMetric) -> City {
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

    init(_ population: Int, location: CLLocation, metricValue: Double) {
        self.fakeMetric = metricValue
        super.init(population, location: location)
    }

    convenience init(city: City, metricValue: Double) {
        self.init(city.population, location: city.location, metricValue: metricValue)
    }
}
