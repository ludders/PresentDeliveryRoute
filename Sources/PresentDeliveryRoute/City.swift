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


