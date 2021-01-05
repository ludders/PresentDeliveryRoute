//
//  File.swift
//  
//
//  Created by dludlow7 on 05/01/2021.
//

import Foundation

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
