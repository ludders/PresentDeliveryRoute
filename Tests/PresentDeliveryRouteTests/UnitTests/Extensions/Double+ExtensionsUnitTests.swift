//
//  File.swift
//  
//
//  Created by dludlow7 on 20/12/2020.
//

import Foundation
import XCTest
@testable import PresentDeliveryRoute

class DoubleExtensionsTests: XCTestCase {
    func testRoundDownTo2DecimalPlaces() {
        let subject = 3.1234567890
        XCTAssertEqual(subject.rounded(digits: 2), 3.12)
    }

    func testRoundUpTo2DecimalPlaces() {
        let subject = 3.1264567890
        XCTAssertEqual(subject.rounded(digits: 2), 3.13)
    }
}
