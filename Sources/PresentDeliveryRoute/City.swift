//
//  File.swift
//  
//
//  Created by dludlow7 on 18/12/2020.
//

import Foundation

class City: Equatable {
    let population: Int

    public init(_ population: Int) {
        self.population = population
    }

    static func == (lhs: City, rhs: City) -> Bool {
        return lhs === rhs
    }
}

func getRoute(_ cities: [City]) -> [City] {
    var route: [City] = []

    cities.sorted { (city1, city2) -> Bool in
        return city1.population > city2.population
    }
    .first
    .map { firstCity -> Void in
        route.append(firstCity)
    }
    return route
}
