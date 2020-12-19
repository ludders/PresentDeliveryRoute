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
        let origin = City(1)
        let bestCity = City(3)
        let worstCity = City(2)
        let cities = [worstCity, bestCity]
        let mockMetric = MockPresentDeliveryMetric()
        XCTAssertEqual(subject.nextBestCity(from: origin, to: cities, using: mockMetric), bestCity)
    }
}
