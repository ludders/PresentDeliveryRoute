//
//  City.swift
//  
//
//  Created by dludlow7 on 18/12/2020.
//

import Foundation
import CoreLocation

class City: Equatable {
    let population: Int
    let location: CLLocation

    public init(_ population: Int, location: CLLocation) {
        self.population = population
        self.location = location
    }

    static func == (lhs: City, rhs: City) -> Bool {
        return lhs === rhs
    }
}

func getRoute(_ cities: [City], using rule: NextBestCityRuleProtocol, metric: PresentDeliveryMetric) -> [City] {
    var route: [City] = []
    var remainingCities = cities

    route.append(cities.biggest)
    remainingCities.removeAll { city -> Bool in
        return city == cities.biggest
    }

    if remainingCities.count > 0 {
        route.append(rule.nextBestCity(from: cities.biggest, to: remainingCities, using: metric))
    }
    
    return route
}
