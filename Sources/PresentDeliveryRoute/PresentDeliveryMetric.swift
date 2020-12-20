//
//  PresentDeliveryMetric.swift
//  
//
//  Created by dludlow7 on 19/12/2020.
//

import Foundation

protocol PresentDeliveryMetric {
    func calculate(from: City, to: City) -> Double
}

class PresentsPerHourMetric: PresentDeliveryMetric {
    func calculate(from origin: City, to destination: City) -> Double {
        let presents = Double(destination.population)
        let presentDeliveryTime = ((presents * 0.001) / 3600).rounded(digits: 2)
        let distanceInKm = origin.location.distance(from: destination.location) / 1000
        let travelTime = (distanceInKm/3000.0).rounded(digits: 2)
        let presentsPerHour = presents / (presentDeliveryTime + travelTime)
        return presentsPerHour.rounded(digits: 2)
    }
}
