//
//  ViewController.swift
//  Map And Tab Bar Demo
//
//  Created by Student on 3/22/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pin = MKPointAnnotation()
        let newYorkLocation = CLLocationCoordinate2D(latitude: 40.73082, longitude: -74.003066)
        pin.coordinate = newYorkLocation
        pin.title = "New York City"
        
        mapView.addAnnotation(pin)
        
        let metersPerMile = 1609.344
        let myRegion = MKCoordinateRegionMakeWithDistance(pin.coordinate,
                                                          100 * metersPerMile,
                                                          100 * metersPerMile)
        mapView.setRegion(myRegion, animated: true)
    }

}

