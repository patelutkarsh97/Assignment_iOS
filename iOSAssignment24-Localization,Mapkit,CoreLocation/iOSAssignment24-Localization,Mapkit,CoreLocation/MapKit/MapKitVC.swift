//
//  MapKitVC.swift
//  iOSAssignment24-Localization,Mapkit,CoreLocation
//
//  Created by Utkarsh Patel on 13/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapKitVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapKitView: MKMapView!
    
    var firstCoordinate = CLLocationCoordinate2DMake(25.282173,83.000087)
    var secondCoordinate = CLLocationCoordinate2DMake(25.288656,82.999218)
    var thirdCoordinate = CLLocationCoordinate2DMake(25.287125,83.000414)
    var fourthCoordinate = CLLocationCoordinate2DMake(25.310869,83.010682)
    var fifthCoordinate = CLLocationCoordinate2DMake(25.318786,83.012844)
    
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapKitView.mapType = .standard
        mapKitView.delegate = self
        locationManager.delegate = self
        
        markAnnotations()
        pathBetweenAnnotations()
        createOverlay()
    }
    
    func markAnnotations(){
        
        let pin1 = MKPointAnnotation()
        pin1.coordinate = firstCoordinate
        pin1.title = "Sankat Mochan Temple"
        pin1.subtitle = "Lanka, Varanasi"
        mapKitView.addAnnotation(pin1)
        
        let pin2 = MKPointAnnotation()
        pin2.coordinate = secondCoordinate
        pin2.title = "Shri Durga Temple"
        pin2.subtitle = "Durgakund, Varanasi"
        mapKitView.addAnnotation(pin2)
        
        let pin3 = MKPointAnnotation()
        pin3.coordinate = thirdCoordinate
        pin3.title = "Tulsi Manas Temple"
        pin3.subtitle = "Durgakund, Varanasi"
        mapKitView.addAnnotation(pin3)
        
        let pin4 = MKPointAnnotation()
        pin4.coordinate = fourthCoordinate
        pin4.title = "Kashi Vishwanath Temple"
        pin4.subtitle = "Godowlia, Varanasi"
        mapKitView.addAnnotation(pin4)
        
        let pin5 = MKPointAnnotation()
        pin5.coordinate = fifthCoordinate
        pin5.title = "Kaal Bhairav Temple"
        pin5.subtitle = "Maidagin, Varanasi"
        mapKitView.addAnnotation(pin5)
    }
    
    func pathBetweenAnnotations(){
        let bhPolyline = MKPolyline(coordinates: [firstCoordinate,fifthCoordinate], count: 2)
        mapKitView.addOverlays([bhPolyline])
    }
    
    func createOverlay(){
        for location in mapKitView.annotations{
            let circle = MKCircle(center: location.coordinate, radius: 10.0)
            mapKitView.addOverlay(circle)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        var annotationView = mapKitView.dequeueReusableAnnotationView(withIdentifier: "Annotation")
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Annotation")
            annotationView!.canShowCallout = true
            annotationView!.rightCalloutAccessoryView = UIButton(type: .infoLight)
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MapKit2VC") as! MapKit2VC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline{
            let polylineRenderer = MKPolylineRenderer(polyline: polyline)
            polylineRenderer.strokeColor = UIColor.green
            polylineRenderer.lineWidth = 3.0
            polylineRenderer.lineDashPattern = [10,5,5,5]
            return polylineRenderer
        }
        
        if let circle = overlay as? MKCircle {
            let circleRenderer = MKCircleRenderer(circle: circle)
            circleRenderer.fillColor = UIColor(red: 0.1, green: 0.6, blue: 0.8, alpha: 0.2)
            circleRenderer.strokeColor = UIColor.purple
            circleRenderer.lineWidth = 4.0
            return circleRenderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
    
}
