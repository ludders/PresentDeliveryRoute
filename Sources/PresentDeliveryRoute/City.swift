//
//  City.swift
//  
//
//  Created by dludlow7 on 18/12/2020.
//

import Foundation

protocol NextBestCityRule {
    func nextBestCity(from: City, destinations: [City]) -> City
}

class City: Equatable {
    let population: Int

    public init(_ population: Int) {
        self.population = population
    }

    static func == (lhs: City, rhs: City) -> Bool {
        return lhs === rhs
    }
}

func getRoute(_ cities: [City], using rule: NextBestCityRule) -> [City] {
    var route: [City] = []
    var remainingCities = cities

    route.append(cities.biggest)
    remainingCities.removeAll { city -> Bool in
        return city == cities.biggest
    }

    if remainingCities.count > 0 {
        route.append(rule.nextBestCity(from: cities.biggest, destinations: remainingCities))
    }
    
    return route
}
