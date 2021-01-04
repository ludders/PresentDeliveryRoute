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

    append(cities.biggest, to: &route, removeFrom: &remainingCities)

    while remainingCities.count > 0 {
        let nextBestCity = rule.nextBestCity(from: route.last!, to: remainingCities)
        append(nextBestCity, to: &route, removeFrom: &remainingCities)
    }
    
    return route
}

fileprivate func append(_ city: City, to route: inout [City], removeFrom remainingCities: inout [City]) {
    route.append(city)
    remainingCities.removeAll { _city -> Bool in
        return _city == city
    }
}
