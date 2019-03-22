//
//  ViewController.swift
//  iOSAssignment12-TableView
//
//  Created by Utkarsh Patel on 11/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    struct Record {
        let profilePic: UIImage
        let name: String
        let age: Int
        let address: String
        let detail: String
    }
    
    var recordArray = [Record]()
   // var displayArray = [Record]()
//    var totalEnteries = 100
//    var limit = 4
//
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var subView: UIView!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    

    @IBOutlet weak var detailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        let nib = UINib.init(nibName: "recordViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "recordCell")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped(gestureRecogniser:)))
        view.addGestureRecognizer(tapGesture)
        
//        var index = 0
//        while index < limit {
//            displayArray.append(recordArray)
//        }
        
        
    }
    

    @IBAction func onClickMore() {
       tableView.reloadData()
//        if displayArray.count == 4{
//            let countIndex = displayArray.count - 1
//            displayArray.removeAll()
//
//            for i in 0...3{
//                displayArray[i] = recordArray[countIndex + i]
//            }
//        }
    }
    
    
    @objc func viewTapped(gestureRecogniser: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func uploadImage(_ sender: Any) {
        
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
        image.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    @IBAction func onClick() {
        
        
        textFieldValidation()
      
    }
    
    
    func textFieldValidation() {
        
        let textFieldOfNameValue = nameTextField.text
        let textFieldOfAgeValue = ageTextField.text
        let textFieldOfAddressValue = addressTextField.text
        let textFieldOfDetailValue = detailTextField.text
        

        if textFieldOfNameValue!.isEmpty {
            
            let alert = UIAlertController(title: "Alert", message: "Enter the name", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
           
            
        }
            
        else if textFieldOfAddressValue!.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Enter the address", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        else if textFieldOfAgeValue!.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Enter the age", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        else if textFieldOfDetailValue!.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Enter the detail", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        else {
            //perform action
            
            recordArray.append(Record(profilePic: image.image!, name: nameTextField.text!, age: Int(ageTextField.text!)!, address: addressTextField.text!, detail: detailTextField.text!))
            print(recordArray)
            subView.isHidden = false
            if recordArray.count < 5 {
            tableView.reloadData()
            }
            
            self.view.bringSubviewToFront(subView)
        }
        //CGSize tableViewSize=tableView.contentSize
    
    }
    
    
    
    
    @IBAction func onClickClose() {
        subView.isHidden = true
       // self.view.bringSubviewToFront(subView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return recordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell") as! recordViewCell

        cell.nameLabel.text = recordArray[indexPath.row].name
        cell.ageLabel.text = String(recordArray[indexPath.row].age)
        cell.addressLabel.text = recordArray[indexPath.row].address
        cell.detailLabel.text = recordArray[indexPath.row].detail
        cell.userImageView.image = recordArray[indexPath.row].profilePic
        if indexPath.row == indexPath.row - 1 {
            print(recordArray)
         //   displayArray = recordArray
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == recordArray.count - 1 {
//            if recordArray.count < totalEnteries {
//                var index = recordArray.count
//                limit = index + 4
//                while index < limit {
//                    displayArray.append(recordArray)
//                    index = index + 1
//                }
//                self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
//            }
//        }
//    }
//
//    @objc func loadTable() {
//        self.tableView.reloadData()
//    }
}

