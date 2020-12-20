//
//  MockPresentDeliveryMetric.swift
//  
//
//  Created by dludlow7 on 19/12/2020.
//

import Foundation
@testable import PresentDeliveryRoute

class FakePresentDeliveryMetric: PresentDeliveryMetric {
    func calculate(from origin: City, to destination: City) -> Double {
        guard let destination = destination as? FakeMetricCity else {
            fatalError("Should only be using a FakeMetricCity here as a fakeMetric is required")
        }
        return destination.fakeMetric
    }
}
