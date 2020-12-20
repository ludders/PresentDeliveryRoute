//
//  File.swift
//  
//
//  Created by dludlow7 on 20/12/2020.
//

import Foundation
import CoreLocation
@testable import PresentDeliveryRoute

enum Stubs {
    public enum locations {
        public static var zero: CLLocation {
            return CLLocation(latitude: 0, longitude: 0)
        }
        public static var newYork: CLLocation {
            return CLLocation(latitude: 40.6635, longitude: 73.9387)
        }
        public static var losAngeles: CLLocation {
            return CLLocation(latitude: 34.0194, longitude: 118.4108)
        }
        public static var chicago: CLLocation {
            return CLLocation(latitude: 41.8376, longitude: 87.6818)
        }
        public static var houston: CLLocation {
            return CLLocation(latitude: 29.7866, longitude: 95.3909)
        }
        public static var phoenix: CLLocation {
            return CLLocation(latitude: 33.5722, longitude: 112.0901)
        }
        public static var philadelphia: CLLocation {
            return CLLocation(latitude: 40.0094, longitude: 75.1333)
        }
        public static var sanAntonio: CLLocation {
            return CLLocation(latitude: 29.4724, longitude: 98.5251)
        }
        public static var sanDiego: CLLocation {
            return CLLocation(latitude: 32.8153, longitude: 117.1350)
        }
        public static var dallas: CLLocation {
            return CLLocation(latitude: 32.7933, longitude: 32.7933)
        }
        public static var sanHose: CLLocation {
            return CLLocation(latitude: 37.2967, longitude: 121.8189)
        }
    }
    public enum cities {
        public static var newYork: City {
            return City(8600000, location: CLLocation(latitude: 40.6635, longitude: 73.9387))
        }
        public static var losAngeles: City {
            return City(4000000, location: CLLocation(latitude: 34.0194, longitude: 118.4108))
        }
        public static var chicago: City {
            return City(2700000, location: CLLocation(latitude: 41.8376, longitude: 87.6818))
        }
        public static var houston: City {
            return City(2300000, location: CLLocation(latitude: 29.7866, longitude: 95.3909))
        }
        public static var phoenix: City {
            return City(1600000, location: CLLocation(latitude: 33.5722, longitude: 112.0901))
        }
        public static var philadelphia: City {
            return City(1600000, location: CLLocation(latitude: 40.0094, longitude: 75.1333))
        }
        public static var sanAntonio: City {
            return City(1500000, location: CLLocation(latitude: 29.4724, longitude: 98.5251))
        }
        public static var sanDiego: City {
            return City(1400000, location: CLLocation(latitude: 32.8153, longitude: 117.1350))
        }
        public static var dallas: City {
            return City(1300000, location: CLLocation(latitude: 32.7933, longitude: 32.7933))
        }
        public static var sanHose: City {
            return City(1000000, location: CLLocation(latitude: 37.2967, longitude: 121.8189))
        }
    }
}
