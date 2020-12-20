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
        let origin = City(1, location: mockLocation)
        let bestCity = City(3, location: mockLocation)
        let worstCity = City(2, location: mockLocation)
        let cities = [worstCity, bestCity]
        let mockMetric = MockPresentDeliveryMetric()
        XCTAssertEqual(subject.nextBestCity(from: origin, to: cities, using: mockMetric), bestCity)
    }
}
