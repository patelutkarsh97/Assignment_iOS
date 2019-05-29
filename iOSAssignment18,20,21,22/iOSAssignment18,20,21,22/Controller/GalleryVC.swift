//
//  ViewController.swift
//  iOSAssignment18,20,21,22
//
//  Created by Utkarsh Patel on 12/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class GalleryVC: UIViewController {
    
    @IBOutlet weak var customNavBar: CustomNavBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var jsonArray = [JSON]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        customNavBar.backButton.isHidden = true
        customNavBar.galleryButton.addTarget(self, action: #selector(self.onClickGalleryButton), for: .touchUpInside)
        customNavBar.exitButton.addTarget(self, action: #selector(self.onClickExitButton), for: .touchUpInside)
        let nib = UINib.init(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectionCell")
        
        fetchDataFromJSON()
    }
    
    @objc func onClickGalleryButton() {
        collectionView.reloadData()
    }
    
    @objc func onClickExitButton() {
        //  Logout Functionality is not given in Question.
    }
    
    func fetchDataFromJSON() {
        let jsonURL = URL(string: "https://picsum.photos/list")
        let session = URLSession(configuration: .default)
        let sessionTask = session.dataTask(with: jsonURL!) { (data, response, error) in
            do {
                if error == nil {
                    self.jsonArray = try JSONDecoder().decode([JSON].self, from: data!)
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


extension GalleryVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let widthOfImage = (collectionView.bounds.width/2.0) - 15
        let heightOfImage = widthOfImage * (3/4)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CustomCollectionViewCell
        let url = "https://picsum.photos/id/\(Int(jsonArray[indexPath.row].id))/\(Int(widthOfImage))/\(Int(heightOfImage))"
        guard let imageURL = URL(string: url) else { return cell }
        UIImage.lodingImage(url: imageURL) { image in
            if let image = image {
                cell.fetchImage(image: image)
            }
        }
        cell.fetchAuthor(authorName: jsonArray[indexPath.row].author)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "nextWindowVC") as! nextWindowVC
        
        let widthOfImage = self.view.bounds.width
        let heightOfImage = self.view.bounds.height
        let imageurl = "https://picsum.photos/id/\(Int(jsonArray[indexPath.row].id))/\(Int(widthOfImage))/\(Int(heightOfImage))"
        guard let url = URL(string: imageurl) else { return }
       // https://picsum.photos/id/\(jsonArray[indexPath.row].id)/\(widthOfImage)/\(heightOfImage)
        UIImage.lodingImage(url: url) { image in
            controller.largeImageView.image = image
//            controller.authorNameLabel.text = self.arrayOfJSON[indexPath.row].author as String
            controller.authorURL = URL(string: self.jsonArray[indexPath.row].author_url)
            controller.activityIndicator.isHidden = true
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthOfImage = (collectionView.bounds.width/2.0)-15
        let heightOfImage = widthOfImage*(3/4)
        
        return CGSize(width: widthOfImage, height: heightOfImage)
    }
}
