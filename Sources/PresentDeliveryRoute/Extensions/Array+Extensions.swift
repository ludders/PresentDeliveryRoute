//
//  Array+Extensions.swift
//  
//
//  Created by dludlow7 on 18/12/2020.
//

import Foundation

extension Array where Element: City {
    var biggest: City {
        return self.sorted { (city1, city2) -> Bool in
            return city1.population > city2.population
        }
        .first!
    }
}
