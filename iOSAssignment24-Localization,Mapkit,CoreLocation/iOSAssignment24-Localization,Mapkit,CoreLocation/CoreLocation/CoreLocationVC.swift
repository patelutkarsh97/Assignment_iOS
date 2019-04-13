//
//  CoreLocationVC.swift
//  iOSAssignment24-Localization,Mapkit,CoreLocation
//
//  Created by Utkarsh Patel on 13/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CoreLocationVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    let locationMgr = CLLocationManager()
    
    @IBOutlet weak var mapKitView: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    
    var locationImage: UIImage!
    let country = Locale.current.regionCode
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        print(country!)
    }
    
    func getLocation() {
        
        let status = CLLocationManager.authorizationStatus()

        switch status {

        case .notDetermined:
            locationMgr.requestWhenInUseAuthorization()
            return


        case .denied, .restricted:
            let alert = UIAlertController(title: "Location Services disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)

            present(alert, animated: true, completion: nil)
            return
            
        case .authorizedAlways, .authorizedWhenInUse:
           // imageView.image = locationImage
            break

        }
        
        locationMgr.delegate = self
        locationMgr.startUpdatingLocation()
    }
    
   @IBAction func onClickImageButton() {
        getLocation()
    
        if (country! == "US") {
            imageView.isHidden = false
            getImageFromURL()
            self.imageView.image = locationImage
        }
        else {
            imageView.isHidden = true
            let alert = UIAlertController(title: "", message: "This feature is not supported in your country", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
          
        }
    }
    
    func getImageFromURL() {
        let imageURL = URL(string: "http://www.newsonair.com/writereaddata/News_Pictures/NAT/2018/Nov/NPIC-201811142185.jpg")
        
        let session = URLSession.shared.dataTask(with: imageURL!) { (data, response, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            self.locationImage = image
            print("image set")
        }
        session.resume()
    }
}
