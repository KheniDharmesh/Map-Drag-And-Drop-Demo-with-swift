//
//  ViewController.swift
//  applemap
//
//  Created by Dharmesh on 06/07/17.
//  Copyright © 2017 Dharmesh. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate{
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate  = self
        let centerLocation = CLLocationCoordinate2D(latitude: 12.964370125970357, longitude: 77.59643554937497)
        let mapspan = MKCoordinateSpanMake(0.01, 0.01)
        let mapregion = MKCoordinateRegionMake(centerLocation, mapspan)
        self.mapView.setRegion(mapregion, animated: true)
        
        let pin = pinAnnotation(title:"hello",subtitle:"how are you",coordinate:centerLocation)
        mapView.addAnnotation(pin)
        
//        let location = CLLocationCoordinate2D(
//            latitude: 51.50007773,
//            longitude: -0.1246402
//        )
//        
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        let region = MKCoordinateRegion(center: location, span: span)
//        mapView.setRegion(region, animated: true)
//        
//        //3
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        annotation.title = "Big Ben"
//        annotation.subtitle = "London"
//        mapView.addAnnotation(annotation)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is pinAnnotation {
            
            let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
            pinAnnotationView.pinTintColor = .purple
            pinAnnotationView.isDraggable = true
            pinAnnotationView.canShowCallout = true
            pinAnnotationView.animatesDrop = true
            
            return pinAnnotationView
        }
        
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        switch newState {
        case .starting:
            view.dragState = .dragging
        case .ending, .canceling:
            print(view.annotation?.coordinate)
            view.dragState = .none
        default: break
        }
    }
}
