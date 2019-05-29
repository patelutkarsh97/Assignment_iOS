//
//  GalleryVC.swift
//  EndGame
//
//  Created by Utkarsh Patel on 19/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class GalleryVC: UIViewController {
    var imageArray = [IMAGEJSON]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        fetchImageFromJSON()
        
        // nib register 
        let nib = UINib.init(nibName: "ImageCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "imageCell")

    }
    
    func fetchImage(image: UIImage) {
        
    }
    
    func fetchImageFromJSON() {
        let jsonURL = URL(string: "https://picsum.photos/list")
        let session = URLSession(configuration: .default)
        let sessionTask = session.dataTask(with: jsonURL!) { (data, response, error) in
            do {
                if error == nil {
                    self.imageArray = try JSONDecoder().decode([IMAGEJSON].self, from: data!)
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }catch {
                print("Error While loading data")
            }
        }
        sessionTask.resume()
    }

}

extension GalleryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let widthOfImage = (collectionView.bounds.width/2.0) - 15
        let heightOfImage = widthOfImage * (3/4)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
       // let urls = "https://picsum.photos/id/\(Int(imageArray[indexPath.row].id))/\(Int(widthOfImage))/\(Int(heightOfImage))"
        let url = "https://picsum.photos/\(Int(widthOfImage))/\(Int(heightOfImage))"
        guard let imageURL = URL(string: url) else { return cell }
        UIImage.lodingImage(url: imageURL) { image in
            if let image = image {
                cell.fetchImage(image: image)
            }
        }
        return cell
    }
    
    
}
