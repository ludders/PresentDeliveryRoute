//
//  File.swift
//  
//
//  Created by dludlow7 on 20/12/2020.
//

import Foundation
import XCTest
@testable import PresentDeliveryRoute

class GetRouteIntegrationTests: XCTestCase {
    func testGetRouteIntegration() {
        let newYork = Stubs.cities.newYork
        let losAngeles = Stubs.cities.losAngeles
        let chicago = Stubs.cities.chicago
        let houston = Stubs.cities.houston
        let phoenix = Stubs.cities.phoenix
        let philadelphia = Stubs.cities.philadelphia
        let sanAntonio = Stubs.cities.sanAntonio
        let sanDiego = Stubs.cities.sanDiego
        let dallas = Stubs.cities.dallas
        let sanHose = Stubs.cities.sanHose

        let cities = [
            newYork,
            losAngeles,
            chicago,
            houston,
            phoenix,
            philadelphia,
            sanAntonio,
            sanDiego,
            dallas,
            sanHose
        ]

        let expectedRoute = [
            newYork,
            philadelphia,
            chicago,
            houston,
            sanAntonio,
            losAngeles,
            sanDiego,
            phoenix,
            sanHose,
            dallas
        ]
        
        let presentsPerHourMetric = PresentsPerHourMetric()
        let nextBestCityRule = NextBestCityRule(metric: presentsPerHourMetric)
        let routeCalculator = RouteCalculator(cities: cities)
        let route = routeCalculator.getRoute(using: nextBestCityRule)
        XCTAssertTrue(route.elementsEqual(expectedRoute))
    }
}
