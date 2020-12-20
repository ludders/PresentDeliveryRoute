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
    func calculate(from: City, to: City) -> Double {
        return 2139037.43
    }
}
