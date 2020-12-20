//
//  NextBestCityRule.swift
//  
//
//  Created by dludlow7 on 18/12/2020.
//

import Foundation

protocol NextBestCityRuleProtocol {
    func nextBestCity(from: City, to: [City]) -> City
}

class NextBestCityRule: NextBestCityRuleProtocol {
    var metric: PresentDeliveryMetric

    init(metric: PresentDeliveryMetric) {
        self.metric = metric
    }

    func nextBestCity(from origin: City, to destinations: [City]) -> City {
        return destinations.max { (city1, city2) -> Bool in
            return metric.calculate(from: origin, to: city1) < metric.calculate(from: origin, to: city2)
        }!
    }
}
