//
//  DetailVC.swift
//  EndGame
//
//  Created by Utkarsh Patel on 24/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import MapKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var customSegment: CustomSegment!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
//        customNavBar.backButton.isHidden = true
//        customNavBar.galleryButton.addTarget(self, action: #selector(self.onClickGalleryButton), for: .touchUpInside)
//        customNavBar.exitButton.addTarget(self, action: #selector(self.onClickExitButton), for: .touchUpInside)
        let nib = UINib.init(nibName: "customCollectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectionCell")
        performActions()
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
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! customCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension = (collectionView.frame.width-30)/3
        
        return CGSize(width: dimension, height: dimension)
    }
    
    
}


