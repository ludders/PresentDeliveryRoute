//
//  City.swift
//  
//
//  Created by dludlow7 on 18/12/2020.
//

import Foundation
import CoreLocation

class City: Equatable {
    let name: String
    let population: Int
    let location: CLLocation

    public init(_ name: String, population: Int, location: CLLocation) {
        self.name = name
        self.population = population
        self.location = location
    }

    static func == (lhs: City, rhs: City) -> Bool {
        return lhs === rhs
    }
}

func getRoute(_ cities: [City], using rule: NextBestCityRuleProtocol) -> [City] {
    var route: [City] = []
    var remainingCities = cities

    route.append(cities.biggest)
    remainingCities.removeAll { city -> Bool in
        return city == cities.biggest
    }

    while remainingCities.count > 0 {
        let nextBestCity = rule.nextBestCity(from: route.last!, to: remainingCities)
        route.append(nextBestCity)
        remainingCities.removeAll { city -> Bool in
            return city == nextBestCity
        }
    }
    
    return route
}
