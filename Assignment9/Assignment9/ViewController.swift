//
//  ViewController.swift
//  Assignment9
//
//  Created by Utkarsh Patel on 05/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    
   
    let city = ["Varanasi","Lucknow","Jaipur","Kanpur","Mirzapur"]
    
    @IBOutlet var usernameTextfield: UIView!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var phoneTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var dobTextField: UITextField!
    private var datePicker: UIDatePicker?
    
    @IBOutlet weak var cityTextField: UITextField!
    private var cityPicker: UIPickerView?
    
   
    var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Registration Page"
        
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dobTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(ViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped(gestureRecogniser:)))
        view.addGestureRecognizer(tapGesture)
        
        
        //cityTextField.inputView = cityPicker
        
        createCityPicker()
        
       designOfTextField()
        
//        textFieldShouldReturn()
        
        
        

        
}
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func createCityPicker() {
        let cityPicker = UIPickerView()
        cityPicker.delegate = self
        cityTextField.inputView = cityPicker
        
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return city.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return city[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityTextField.text = city[row]
        view.endEditing(false)
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyy"
        
        dobTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(false)
        
    }
    
    @objc func viewTapped(gestureRecogniser: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    
    
    
    
    func designOfTextField() {
        usernameTextfield.layer.borderWidth = 2
        usernameTextfield.layer.borderColor = UIColor.init(red: 114/255, green: 19/255, blue: 239/255, alpha: 1) .cgColor
        usernameTextfield.layer.cornerRadius = 5.0
        usernameTextfield.layer.masksToBounds = true
        
        passwordTextfield.layer.borderWidth = 2
        passwordTextfield.layer.borderColor = UIColor.init(red: 114/255, green: 19/255, blue: 239/255, alpha: 1) .cgColor
        passwordTextfield.layer.cornerRadius = 5.0
        passwordTextfield.layer.masksToBounds = true
        
        phoneTextfield.layer.borderWidth = 2
        phoneTextfield.layer.borderColor = UIColor.init(red: 114/255, green: 19/255, blue: 239/255, alpha: 1) .cgColor
        phoneTextfield.layer.cornerRadius = 5.0
        phoneTextfield.layer.masksToBounds = true
        
        emailTextfield.layer.borderWidth = 2
        emailTextfield.layer.borderColor = UIColor.init(red: 114/255, green: 19/255, blue: 239/255, alpha: 1) .cgColor
        emailTextfield.layer.cornerRadius = 5.0
        emailTextfield.layer.masksToBounds = true
        
        dobTextField.layer.borderWidth = 2
        dobTextField.layer.borderColor = UIColor.init(red: 114/255, green: 19/255, blue: 239/255, alpha: 1) .cgColor
        dobTextField.layer.cornerRadius = 5.0
        dobTextField.layer.masksToBounds = true
        
        cityTextField.layer.borderWidth = 2
        cityTextField.layer.borderColor = UIColor.init(red: 114/255, green: 19/255, blue: 239/255, alpha: 1) .cgColor
        cityTextField.layer.cornerRadius = 5.0
        cityTextField.layer.masksToBounds = true
        
    }
    
    
    
    
}





