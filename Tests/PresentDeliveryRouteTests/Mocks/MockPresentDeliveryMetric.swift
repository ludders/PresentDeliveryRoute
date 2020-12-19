//
//  MockPresentDeliveryMetric.swift
//  
//
//  Created by dludlow7 on 19/12/2020.
//

import Foundation
@testable import PresentDeliveryRoute

class MockPresentDeliveryMetric: PresentDeliveryMetric {
    func calculate(from origin: City, to destination: City) -> Double {
        return Double(destination.population)
    }
}
