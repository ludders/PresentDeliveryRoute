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
        let distanceInKm = calculateDistanceKmBetween(origin, destination)
        let presentsPerHour = calculatePresentsPerHour(presents, distanceInKm)
        return presentsPerHour.rounded(digits: 2)
    }

    private func calculateDeliveryTime(_ presents: Double) -> Double {
        return ((presents * 0.001) / 3600).rounded(digits: 2)
    }

    private func calculateDistanceKmBetween(_ origin: City, _ destination: City) -> Double {
        return origin.location.distance(from: destination.location) / 1000
    }

    private func calculateTravelTime(_ distanceInKm: Double) -> Double {
        return (distanceInKm/3000.0).rounded(digits: 2)
    }

    private func calculatePresentsPerHour(_ presents: Double, _ distanceInKm: Double) -> Double {
        return presents / (calculateDeliveryTime(presents) + calculateTravelTime(distanceInKm))
    }
}
