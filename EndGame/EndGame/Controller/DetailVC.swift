//
//  DetailVC.swift
//  EndGame
//
//  Created by Utkarsh Patel on 24/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import MapKit

class DetailVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var customSegment: CustomSegment!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
//        customNavBar.backButton.isHidden = true
//        customNavBar.galleryButton.addTarget(self, action: #selector(self.onClickGalleryButton), for: .touchUpInside)
//        customNavBar.exitButton.addTarget(self, action: #selector(self.onClickExitButton), for: .touchUpInside)
        let nib = UINib.init(nibName: "ImageCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "imageCell")
        performActions()
        fillDetailsOfEmp()
        checkLocationServices()
        
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        mapView.addGestureRecognizer(longTapGesture)
    }
    
    private func performActions() {
        customSegment.galleryButton.addTarget(self, action: #selector(self.onClickGalleryButton), for: .touchUpInside)
        
        customSegment.addPhotoButton.addTarget(self, action: #selector(self.onClickAddPhotoButton), for: .touchUpInside)
        
         customSegment.mapButton.addTarget(self, action: #selector(self.onClickMapButton), for: .touchUpInside)
        
         customSegment.addMapButton.addTarget(self, action: #selector(self.onClickAddMapButton), for: .touchUpInside)
    }
    
    
    @objc func onClickAddPhotoButton() {
        customSegment.galleryButton.backgroundColor = .lightGray
        customSegment.addPhotoButton.backgroundColor = .lightGray
        customSegment.mapButton.backgroundColor = .clear
        customSegment.addMapButton.backgroundColor = .clear
        
      //  activatePicerView()
    }
    
    @objc func onClickGalleryButton() {
        mapView.isHidden = true
        collectionView.isHidden = false
        customSegment.galleryButton.backgroundColor = .lightGray
        customSegment.addPhotoButton.backgroundColor = .lightGray
        customSegment.mapButton.backgroundColor = .clear
        customSegment.addMapButton.backgroundColor = .clear
    }
    
    @objc func onClickMapButton() {
        collectionView.isHidden = true
        mapView.isHidden = false
        customSegment.mapButton.backgroundColor = .lightGray
        customSegment.addMapButton.backgroundColor = .lightGray
        customSegment.galleryButton.backgroundColor = .clear
        customSegment.addPhotoButton.backgroundColor = .clear
    }
    
    @objc func onClickAddMapButton() {
        customSegment.mapButton.backgroundColor = .lightGray
        customSegment.addMapButton.backgroundColor = .lightGray
        customSegment.galleryButton.backgroundColor = .clear
        customSegment.addPhotoButton.backgroundColor = .clear
    }
}

extension DetailVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let widthOfImage = (collectionView.bounds.width/2.0) - 15
        let heightOfImage = widthOfImage * (3/4)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
        let url = "https://picsum.photos/\(Int(widthOfImage))/\(Int(heightOfImage))"
    
        guard let imageURL = URL(string: url) else { return cell }
        UIImage.lodingImage(url: imageURL) { image in
            if let image = image {
                cell.fetchImage(image: image)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension = (collectionView.frame.width-30)/3
        
        return CGSize(width: dimension, height: dimension)
    }
    
    func fillDetailsOfEmp() {
        nameLabel.text = employeeName
        salaryLabel.text = employeeSalary
        ageLabel.text = employeeAge
    }
    
    func activatePicerView() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let selectPic = UIAlertController(title: "Upload Photo", message: "Select the source", preferredStyle: .actionSheet)
        
        selectPic.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(selectPic, animated: true, completion:  nil)
            
        }))
        
        
        selectPic.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            //self.present(selectPic, animated: true, completion: nil)
        }))
        
        selectPic.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(selectPic, animated: true, completion:  nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //MARK: CHANGES IN PICKERVIEW
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //userProfilePic.image = pickedImage
        //imageArray.append([pickedImage])
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
}


extension DetailVC : MKMapViewDelegate {
    
    @objc func longTap(sender: UIGestureRecognizer){
        print("long tap")
        if sender.state == .began {
            let locationInView = sender.location(in: mapView)
            let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
            addAnnotation(location: locationOnMap)
            
        }
    }
    
    func addAnnotation(location: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "\(employeeName!)"
        // annotation.subtitle = "User Subtitle"
        self.mapView.addAnnotation(annotation)
    }
    
    func showAlert(alertString: String) {
        let alert = UIAlertController(title: nil, message: alertString, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK",
                                     style: .cancel) { (alert) -> Void in
        }
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { print("no mkpointannotaions"); return nil }
        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.rightCalloutAccessoryView = UIButton(type: .infoDark)
            pinView!.pinTintColor = UIColor.orange
        }
        else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("tapped on pin ")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            if let doSomething = view.annotation?.title! {
                print(doSomething)
            }
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            // setup our location manager
            setupLocationManager()
            checkLocationAuthorisation()
        } else {
            // show alert box
        }
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationAuthorisation() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            // Show alert how to turn on location persmission
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show alert letting them know
            break
        case .authorizedAlways:
            break
        }
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
}

extension DetailVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorisation()
    }
    
}
