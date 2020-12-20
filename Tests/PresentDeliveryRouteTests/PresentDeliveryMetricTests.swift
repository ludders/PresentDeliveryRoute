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
        let newYork = City(8600000, location: CLLocation(latitude: 40.6635, longitude: 73.9387))
        let losAngeles = City(4000000, location: CLLocation(latitude: 34.0194, longitude: 118.4108))
        XCTAssertEqual(metric.calculate(from: newYork, to: losAngeles), 1646090.53)
    }

    //New York 40.6635°N 73.9387°W to...
    //Chicago, population 2.7m, 41.8376°N 87.6818°W
    //Presents to deliver = 2700000
    //Time to deliver = (2700000 x 0.001) / 3600 = 0.75
    //Travel time = 1158 / 3000 = 0.39
    //Metric = 2700000 / (0.75 + 0.39) = 2368421.05 [presents/h]
    func testPresentsPerHourMetricCalculationFromNewYorkToChicago() {
        let metric = PresentsPerHourMetric()
        let newYork = City(8600000, location: CLLocation(latitude: 40.6635, longitude: 73.9387))
        let chicago = City(2700000, location: CLLocation(latitude: 41.8376, longitude: 87.6818))
        XCTAssertEqual(metric.calculate(from: newYork, to: chicago), 2368421.05)
    }
}
