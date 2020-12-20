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
        let mockLocation = Stubs.locations.zero
        let origin = FakeMetricCity(1, location: mockLocation, metricValue: 0)
        let bestCity = FakeMetricCity(3, location: mockLocation, metricValue: 2)
        let worstCity = FakeMetricCity(2, location: mockLocation, metricValue: 1)
        let cities = [worstCity, bestCity]
        let fakeMetric = FakePresentDeliveryMetric()
        XCTAssertEqual(subject.nextBestCity(from: origin, to: cities, using: fakeMetric), bestCity)
    }
}
