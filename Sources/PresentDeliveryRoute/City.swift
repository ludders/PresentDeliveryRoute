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

class RouteCalculator {
    var route: [City] = []
    var remainingCities: [City]

    init(cities: [City]) {
        self.remainingCities = cities
    }

    func getRoute(using rule: NextBestCityRuleProtocol) -> [City] {

        addToRoute(remainingCities.biggest)

        while remainingCities.count > 0 {
            let nextBestCity = rule.nextBestCity(from: route.last!, to: remainingCities)
            addToRoute(nextBestCity)
        }

        return route
    }

    private func addToRoute(_ city: City) {
        route.append(city)
        remainingCities.removeAll { _city -> Bool in
            return _city == city
        }
    }
}

