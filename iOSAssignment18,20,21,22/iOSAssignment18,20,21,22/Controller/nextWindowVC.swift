//
//  nextWindowVC.swift
//  iOSAssignment18,20,21,22
//
//  Created by Utkarsh Patel on 12/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class nextWindowVC: UIViewController {

    @IBOutlet weak var toastLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var authorButton: UIButton!
    @IBOutlet weak var customNavBar: CustomNavBar!
    @IBOutlet weak var largeImageView: UIImageView!
    
    var authorURL = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
         performActions()

    }
    @IBAction func onClickDownload(_ sender: Any) {
         toastLabel.toast(message: "Image is downloading")
    }
    @IBAction func onClickAuthor(_ sender: Any) {
         UIApplication.shared.open(authorURL!, options: [:], completionHandler: nil)
    }
    
    private func performActions() {
        customNavBar.backButton.addTarget(self, action: #selector(self.onClickBackButton), for: .touchUpInside)
        
        customNavBar.galleryButton.addTarget(self, action: #selector(self.onClickGalleryButton), for: .touchUpInside)
        
        customNavBar.exitButton.addTarget(self, action: #selector(self.onClickExitButton), for: .touchUpInside)
    }
    
    
    @objc func onClickBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func onClickGalleryButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func onClickExitButton() {
       //  Logout Functionality is not given in Question.
        toastLabel.toast(message: "This Functionality is not available at this moment")
    }
}
