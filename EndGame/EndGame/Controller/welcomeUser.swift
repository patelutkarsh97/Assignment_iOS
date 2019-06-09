//
//  welcomeUser.swift
//  EndGame
//
//  Created by Utkarsh Patel on 30/05/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import MapKit

class welcomeUser: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var userProfilePic: UIImageView!
    
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    @IBOutlet weak var userMapView: MKMapView!
    @IBOutlet weak var chooseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func onClickChooseButton(_ sender: Any) {
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
        
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        userProfilePic.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func onClickLogoutButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
