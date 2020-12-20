//
//  File.swift
//  
//
//  Created by dludlow7 on 19/12/2020.
//

import Foundation
import XCTest
@testable import PresentDeliveryRoute

//Presents per hour metric:
//      (Presents to deliver at destination) / (Time to deliver all presents + Travel time)
//
//      Presents to deliver = Population
//      Time to deliver all presents [h] = (Population x 0.001) / 3600
//      Travel time = 3000 [km/h] / Distance between two cities [km]
//

class PresentsPerHourMetricTests: XCTestCase {
//New York [40.6635°N 73.9387°W]
//Los Angeles, population 4m, [34.0194°N 118.4108°W]
//Presents to deliver = 4000000
//Time to deliver = (4000000 x 0.001) / 3600 = 1.11
//Travel time = 3966 / 3000 = 1.32
//Metric = 4000000 / (1.11 + 1.32) = 1646090.53 [presents/h]
    func testPresentsPerHourMetricCalculationFromNewYorkToLosAngeles() {
        let metric = PresentsPerHourMetric()
        let newYork = City(8600000)
        let losAngeles = City(4000000)
        XCTAssertEqual(metric.calculate(from: newYork, to: losAngeles), 1646090.53)
    }
}
