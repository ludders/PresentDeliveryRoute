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
    }
    public enum cities {
        public static var city: City {
            return City("city", population: 1, location: locations.zero)
        }
        public static var biggerCity: City {
            return City("bigger city", population: 2, location: locations.zero)
        }
        public static var newYork: City {
            return City("New York", population: 8600000, location: CLLocation(latitude: 40.6635, longitude: 73.9387))
        }
        public static var losAngeles: City {
            return City("Los Angeles", population: 4000000, location: CLLocation(latitude: 34.0194, longitude: 118.4108))
        }
        public static var chicago: City {
            return City("Chicago", population: 2700000, location: CLLocation(latitude: 41.8376, longitude: 87.6818))
        }
        public static var houston: City {
            return City("Houston", population: 2300000, location: CLLocation(latitude: 29.7866, longitude: 95.3909))
        }
        public static var phoenix: City {
            return City("Phoenix", population: 1600000, location: CLLocation(latitude: 33.5722, longitude: 112.0901))
        }
        public static var philadelphia: City {
            return City("Philadelphia", population: 1600000, location: CLLocation(latitude: 40.0094, longitude: 75.1333))
        }
        public static var sanAntonio: City {
            return City("San Antonio", population: 1500000, location: CLLocation(latitude: 29.4724, longitude: 98.5251))
        }
        public static var sanDiego: City {
            return City("San Diego", population: 1400000, location: CLLocation(latitude: 32.8153, longitude: 117.1350))
        }
        public static var dallas: City {
            return City("Dallas", population: 1300000, location: CLLocation(latitude: 32.7933, longitude: 32.7933))
        }
        public static var sanHose: City {
            return City("San Hose", population: 1000000, location: CLLocation(latitude: 37.2967, longitude: 121.8189))
        }
    }
}
