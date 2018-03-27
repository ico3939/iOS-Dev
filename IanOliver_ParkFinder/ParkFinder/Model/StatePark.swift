//
//  StatePark.swift
//  ParkFinder
//
//  Created by Student on 3/22/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

public struct StateParkList: Codable {
    var parks: [StatePark]
}


public class StatePark: NSObject, Codable, MKAnnotation { // allows us to do print statements for our objects and code and decode them
    private var name: String
    private var latitude: Double
    private var longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case name
        case latitude
        case longitude
        
    }
    
    public init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            self.name = try values.decode(String.self, forKey: .name)
        }
        catch {
            print("No name")
            self.name = ""
        }
        
        let latitudeString = try values.decode(String.self, forKey: .latitude)
        let longitudeString = try values.decode(String.self, forKey: .longitude)
        
        self.latitude = Double(latitudeString)!
        self.longitude = Double(longitudeString)!
    }
    
    public override var description: String {
        return "\(name): (\(latitude),\(longitude))"
    }
    
    public var title: String? {
        return name
    }
    
    public var subtitle: String? {
        return "I ❤ NY"
    }

}

extension StatePark {
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(CLLocationDegrees(latitude), CLLocationDegrees(longitude))
    }

}
