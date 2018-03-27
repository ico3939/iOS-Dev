//
//  ViewController.swift
//  ParkFinder
//
//  Created by Student on 3/22/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var metersPerMile:Double = 1609.34
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        loadData()
        
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "parks", withExtension: "json") else {
            print("Eror: could not find path parks.json")
            return
        }
        
        //        if let path = Bundle.main.url(forResource: "parks", withExtension: "json") {
        print(path)
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: path)
            let parkList = try decoder.decode(StateParkList.self, from: data)
            print(parkList)
            
            mapView.addAnnotations(ParkData.sharedData.parks)
            
            let myRegion = MKCoordinateRegionMakeWithDistance(parkList.parks[0].coordinate, metersPerMile * 100, metersPerMile * 100)
            mapView.setRegion(myRegion, animated: true)
            mapView.selectAnnotation(parkList.parks[0], animated: true)
            ParkData.sharedData.parks = parkList.parks
            
        } catch {
            print("Error: could not initialize JSON data")
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let title = view.annotation?.title ?? "No title Found"
        print("Tapped \(title!))")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? StatePark else {
            print("This annotation isn't a StatePark")
            return nil
        }
        
        let identifier = "pinIdentifier"
        let view: MKPinAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
            // reuse an existing view
            dequeuedView.annotation = annotation
            view = dequeuedView
        }
        else {
            // make a new view and put a button in it
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type:.detailDisclosure) as UIView
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped contol: UIControl) {
        guard let annotation = view.annotation as? StatePark else {
            print("This annotation isn't a StatePark")
            return
        }
        
        print("Tapped info button for\(annotation.description)")
        print("Maybe we could do something more interesting here, like go to a related URL, open the maps app and show the location, or show some park info in a new VC or tab.")
    }
}

