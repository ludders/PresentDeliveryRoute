//
//  NextBestCityRule.swift
//  
//
//  Created by dludlow7 on 18/12/2020.
//

import Foundation

protocol NextBestCityRuleProtocol {
    func nextBestCity(from: City, to: [City], using: PresentDeliveryMetric) -> City
}

class NextBestCityRule: NextBestCityRuleProtocol {
    func nextBestCity(from origin: City, to destinations: [City], using metric: PresentDeliveryMetric) -> City {
        return destinations.sorted { (city1, city2) -> Bool in
            return metric.calculate(from: origin, to: city1) > metric.calculate(from: origin, to: city2)
        }.first!
    }
}
