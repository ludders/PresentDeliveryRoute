//
//  NextBestCityRuleTests.swift
//  
//
//  Created by dludlow7 on 19/12/2020.
//

import Foundation
import XCTest
@testable import PresentDeliveryRoute

class NextBestCityRuleTests: XCTestCase {
    func testNextBestCityRuleReturnsCityWithHighestPresentsPerHourRate() {
        let subject = NextBestCityRule()
        let origin = FakeMetricCity(city: Stubs.cities.city, metricValue: 0)
        let bestCity = FakeMetricCity(city: Stubs.cities.city, metricValue: 2)
        let worstCity = FakeMetricCity(city: Stubs.cities.city, metricValue: 1)
        let cities = [worstCity, bestCity]
        let fakeMetric = FakePresentDeliveryMetric()
        XCTAssertEqual(subject.nextBestCity(from: origin, to: cities, using: fakeMetric), bestCity)
    }
}
