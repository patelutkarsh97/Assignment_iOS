//
//  customTableCell.swift
//  iOS Assignment 13 - Collection View
//
//  Created by Utkarsh Patel on 17/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class customTableCell: UITableViewCell {
    let section = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]
//    let items = [
//        ["","","","","","","","","",""],//Action
//        ["","","","","","","","","",""], //Drama
//        ["","","","","","","","","",""], //Science Fiction
//        ["","","","","","","","","",""], //Kids
//        ["","","","","","","","","",""], //Horror
//    ]
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib.init(nibName: "customCollectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension customTableCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.section.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! customCollectionCell
        return cell
    }
    
    
}

