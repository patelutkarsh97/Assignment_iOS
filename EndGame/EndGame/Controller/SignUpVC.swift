//
//  SignUpVC.swift
//  EndGame
//
//  Created by Utkarsh Patel on 24/05/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    var signupCode: Int!
    var signupMessage: String!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var toastLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickCreateAccountButton(_ sender: Any) {
        
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let password = passwordTextField.text!
        let mail = emailTextField.text!
        let parameters = ["firstName" : firstName ,
                          "lastName" : lastName,
                          "mail" : mail,
                          "password" : password ]
        
        guard let url = URL(string: "https://qa.curiousworld.com/api/v2/SignUp") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else {
            return }
        request.httpBody = httpBody
        let session = URLSession.shared
        print("============%@", parameters)
        print("============%@", request.allHTTPHeaderFields)
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                        print("json \(json)")
                        if let statusMessage = json["status"] as? [String:Any]{
                            print(statusMessage)
                            guard let codeResponse = statusMessage["code"] as? Int else {return}
                            print("=========================== \(codeResponse)")
                            self.signupCode = codeResponse
//                            DispatchQueue.main.async {
//                                self.navigate()
//                            }
                        }
                        if let statusMessage = json["status"] as? [String:Any]{
                            print(statusMessage)
                            guard let codeMessageResponse = statusMessage["message"] as? String else {return}
                            print("=========================== \(codeMessageResponse)")
                            self.signupMessage = codeMessageResponse ?? "Email Already Registered"
                            DispatchQueue.main.async {
                                self.navigate()
                            }
                        }
                    }
                } catch {
                    print(error)
                }
            }
            
            }.resume()
        print(signupCode)
    }
    
    func navigate() {
        if(signupCode == 1)
        {
            toastLabel.toast(message: "Registered Successfully")
            //let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //let contoller = storyboard.instantiateViewController(withIdentifier: "welcomeUser")
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.callbackPOP), userInfo: nil, repeats: false)
        }
        else
        {
            toastLabel.toast(message: "\(signupMessage!)")
        }
    }
    
    @objc func callbackPOP() {
        self.navigationController?.popViewController(animated: true)
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
    }
}
