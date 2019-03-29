//
//  HomePageVC.swift
//  TTN Greetings App
//
//  Created by Utkarsh Patel on 22/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class WelcomePageVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, LoggableProtocol {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var browseButton: UIButton!
    @IBOutlet weak var greetButton: UIButton!
    
    var userType : UserAccount?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImageView.imageRound()
        userImageView.imageBorder()
        greetButton.roundButton()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib.init(nibName: "TableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
    }
    @IBAction func onClickGreetButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GreetingVC")
        self.navigationController?.pushViewController(controller,animated: true)
    }
    @IBAction func onClickLogout(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        let alert = UIAlertController(title: nil, message: "Successfully Logout", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated:  true)
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
        tableView.reloadData()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        userImageView.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }

}

extension WelcomePageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let user = userArray[indexPath.row]
        let cell : TableCell =  tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableCell
        cell.userImageView.image = userImageView.image
        cell.userData = userType
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

