//
//  SignUpVC.swift
//  TTN Greetings App
//
//  Created by Utkarsh Patel on 23/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
var flag = 0
struct UserAccount {
    var name: String
    var phone: Int
    var email: String
    var dob: String
    var password: String
}
var userArray = [UserAccount]()
let indicator = UIActivityIndicatorView(style: .whiteLarge)
class SignUpVC: UIViewController, ActivityIndicating {
    private var datePicker: UIDatePicker?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var toastLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldBorder()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LogInVC.viewTapped(gestureRecogniser:)))
        view.addGestureRecognizer(tapGesture)
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dobTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(SignUpVC.dateChanged(datePicker:)), for: .valueChanged)
        
    }
    @objc func viewTapped(gestureRecogniser: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func onClickCreateAccount(_ sender: Any) {
        passwordTextFieldEditOnEnd(passwordTextField.text as Any)
        if (flag == 0) {
        showActivityIndicator()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(callback), userInfo: nil, repeats: false)
        }
    }
    
    @objc func callback() {
        print("done")
        
        if
            (nameTextField.text == "" || phoneTextField.text == "" || emailTextField.text == "" || dobTextField.text == "" || passwordTextField.text == "") {
            toastLabel.toast(message: "All fields are mandatory")
        }
        else {
            userArray.append(UserAccount(name: nameTextField.text!, phone: Int(phoneTextField.text!)!, email: emailTextField.text!, dob: String(dobTextField.text!), password: passwordTextField.text!))
            toastLabel.toast(message: "Registered Successfully")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let contoller = storyboard.instantiateViewController(withIdentifier: "LogInVC")
            self.navigationController?.pushViewController(contoller,animated: true)
            
        }
        hideActivityIndicator()
    }
    
    
    func textFieldBorder() {
        createAccountButton.roundButton()
        nameTextField.textFormatting()
        phoneTextField.textFormatting()
        emailTextField.textFormatting()
        dobTextField.textFormatting()
        passwordTextField.textFormatting()
    }
    
    @IBAction func phoneNumberTextEditOnEnd()
    {
        if(phoneTextField.validationPhone() == false)
        {
            
            phoneTextField.text = ""
            toastLabel.toast(message: "Invalid Phone Number")
        }
        
    }
    
    @IBAction func nameTextEditOnEnd(_ sender: Any) {
        if(nameTextField.validationName() == false)
        {
            
            nameTextField.text = ""
            toastLabel.toast(message: "Invalid Name!")
        }
    }
    
    @IBAction func emailTextFieldEditOnEnd(_ sender: Any) {
        
        //emailTextField.emailValidation(email: emailTextField.text!)
        let valid = emailTextField.emailValidation(email: emailTextField.text!)
        if(valid == false)
        {
            toastLabel.toast(message: "Incorrect Email..........")
            flag = flag + 1
        }
        else {
            flag = 0
        }
    }
    
    @IBAction func passwordTextFieldEditOnEnd(_ sender: Any) {
        //passwordTextField.passwordValidation(password: passwordTextField.text!)
        let valid = passwordTextField.passwordValidation(password: passwordTextField.text!)
        
        if(valid == false)
        {
            toastLabel.toast(message: "Use strong password......")
            flag = flag + 1
        }
        else {
            flag = 0
        }
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "MM/dd/yyy"
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dobTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(false)
    }
}



protocol Formatting {
    func textFormatting()
}

extension UITextField : Formatting {
    func textFormatting() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 0.07 * self.bounds.size.width
        
    }
}
// MARK: QUESTION 3
protocol ErrorViewProtocol : class {
    func validationPhone() -> Bool
    func validationName() -> Bool
}

extension UITextField : ErrorViewProtocol
{
    func validationName() -> Bool {
        let nameRegex = "^[a-zA-Z][a-zA-Z\\s]+$"
        //  [A-Za-z]{2,}\\s?[A-Za-z]{2,}?\\s?[A-Za-z]{2,}?
        let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let result =  nameTest.evaluate(with: self.text!)
        return result
    }
    
    func validationPhone() -> Bool {
        let phoneRegex = "[6789410]{2}[0-9]{8}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let result =  phoneTest.evaluate(with: self.text!)
        return result
    }
}

extension ErrorViewProtocol where Self : UIViewController {}


// MARK: QUESTION 1
extension Date {
    
    func getDateDDMMYYYY() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}

// MARK: QUESTION 4
protocol ActivityIndicating {
    func showActivityIndicator()
    func hideActivityIndicator()
}

extension ActivityIndicating where Self: UIViewController
{
    func showActivityIndicator() {
        
        indicator.startAnimating()
        indicator.center = self.view.center
        indicator.backgroundColor = .lightGray
        self.view.addSubview(indicator)
        
    }
    //    func showActivityIndicatory(uiView: UIView) {
    //        var container: UIView = UIView()
    //        container.frame = uiView.frame
    //        container.center = uiView.center
    //        container.backgroundColor = UIColorFromHex(0xffffff, alpha: 0.3)
    //
    //        var loadingView: UIView = UIView()
    //        loadingView.frame = CGRectMake(0, 0, 80, 80)
    //        loadingView.center = uiView.center
    //        loadingView.backgroundColor = UIColorFromHex(0x444444, alpha: 0.7)
    //        loadingView.clipsToBounds = true
    //        loadingView.layer.cornerRadius = 10
    //
    //        var actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    //        actInd.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    //        actInd.activityIndicatorViewStyle =
    //            UIActivityIndicatorViewStyle.WhiteLarge
    //        actInd.center = CGPointMake(loadingView.frame.size.width / 2,
    //                                    loadingView.frame.size.height / 2);
    //        loadingView.addSubview(actInd)
    //        container.addSubview(loadingView)
    //        uiView.addSubview(container)
    //        actInd.startAnimating()
    //    }
    //    func showActivityIndicator() {
    //        self.activityIndicator.style = .whiteLarge
    //        self.activityIndicator.frame =  CGRect(x: 160, y: 160, width: 80, height: 80)
    //        self.activityIndicator.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.height / 2)
    //        self.view.addSubview(self.activityIndicator)
    //        self.activityIndicator.startAnimating()
    //    }
    //
    func hideActivityIndicator() {
        indicator.stopAnimating()
        indicator.removeFromSuperview()
    }
}

