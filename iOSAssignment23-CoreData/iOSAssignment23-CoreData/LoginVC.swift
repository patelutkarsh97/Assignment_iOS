//
//  ViewController.swift
//  iOSAssignment23-CoreData
//
//  Created by Utkarsh Patel on 10/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonOfLoginVC: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        fileURL[fileURL.count-1]
        print(fileURL)
        emailTextField.delegate = self
        emailTextField.tag = 0
        passwordTextField.delegate = self
        passwordTextField.tag = 1
    }
    override func viewWillAppear(_ animated: Bool) {
        if(UserDefaults.standard.bool(forKey: "login")){
            let storyboard = UIStoryboard(name: "Main", bundle:  nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
            self.navigationController?.pushViewController(controller, animated: false)
        }
    }
    @IBAction func onClickLogin(_ sender: Any) {
        if emailTextField.text == "" {
            UIView.transition(with: emailTextField, duration: 0.7, options: .transitionFlipFromLeft, animations: {}, completion: nil)
        }
        else if passwordTextField.text == "" {
            UIView.transition(with: passwordTextField, duration: 0.7, options: .transitionFlipFromRight, animations: {}, completion: nil)
        }
        else {
            UserDefaults.standard.set(true, forKey: "login")
            let storyboard = UIStoryboard(name: "Main", bundle:  nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
            self.navigationController?.pushViewController(controller, animated: true)
            
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
}

