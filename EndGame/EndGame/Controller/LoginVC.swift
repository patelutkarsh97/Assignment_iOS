//
//  LoginVC.swift
//  EndGame
//
//  Created by Utkarsh Patel on 19/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,UITextFieldDelegate {
    var forgotMessage: String!
    var forgotCode: Int!
    var mainCode: Int!
    var emailValidationCode: Int!
    var emailMessage: String!
    var fname: String!
    var lname: String!
    @IBOutlet weak var toastLabel: UILabel!
    @IBOutlet weak var userView: SignInView!
    @IBOutlet weak var passwordView: LogInView!
    var flag = 0
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextButtonOfPasswordView: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordView.isHidden = true
        nextButtonOfPasswordView.isHidden = true
        passwordView.emailDisplayButton.addTarget(self, action: #selector(self.onClickImageDisplayButton), for: .touchUpInside)
        passwordView.forgotPasswordButton.addTarget(self, action: #selector(self.onClickForgetButton), for: .touchUpInside)
        
        passwordView.reTypePasswordTextField.delegate = self
        passwordView.passwordTextField.delegate = self
        userView.emailTextField.delegate = self
    }
    
    @IBAction func onClickNextButton(_ sender: Any) {
        let mail = userView.emailTextField.text
        let parameters = ["mail" : mail]
        guard let url = URL(string: "https://qa.curiousworld.com/api/v2/Validate/Email?_format=json") else { return }
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
                        if let statusCode = json["status"] as? [String:Any]{
                            print(statusCode)
                            guard let codeResponse = statusCode["code"] as? Int else {return}
                            print("=========================== \(codeResponse)")
                            self.emailValidationCode = codeResponse
                            self.validation()
                        }
                        if let statusMessage = json["status"] as? [String:Any]{
                            print(statusMessage)
                            guard let codeResponseMessage = statusMessage["message"] as? String else {return}
                            print("=========================== \(codeResponseMessage)")
                            self.emailMessage = codeResponseMessage
                            self.toastLabel.toast(message: self.emailMessage)
                        }
                    }
                } catch {
                    print(error)
                }
            }
            
            }.resume()
        print(emailValidationCode)
        print(emailMessage)
    }

//    @IBAction func onClickNextButtonOfPasswordView(_ sender: Any) {
//        if(passwordView.passwordTextField.text! == passwordView.reTypePasswordTextField.text!)
//        {
//            passwordView.validationImage.image = UIImage(named: "tick.png")
//        }
//        else {
//            passwordView.validationImage.image = UIImage(named: "cross.png")
//        }
//        let mail = userView.emailTextField.text!
//        let password = passwordView.passwordTextField.text!
//        let parameters = ["mail" : mail ,
//                          "password" : password,
//                          "client_secret" : "abcde12345",
//                          "client_id" : "ec7c3bde-9f51-4113-9ecf-6ca6fd03b66b",
//                          "scope" : "ios",
//                          "grant_type" : "password"]
//
//        func getPostData(params:[String:String]) -> Data
//        {
//            var data = Data()
//            for(key, value) in params
//            {
//                let string = "--CuriousWorld\r\n".data(using: .utf8)
//                data.append(string!)
//                data.append(String.init(format: "Content-Disposition: form-data; name=%@\r\n\r\n", key).data(using: .utf8)!)
//                data.append(String.init(format: "%@\r\n", value).data(using: .utf8)!)
//                data.append(String.init(format: "--CuriousWorld--\r\n").data(using: .utf8)!)
//            }
//            return data
//        }
//
//        let paramData = getPostData(params: parameters)
//        guard let url = URL(string: "https://qa.curiousworld.com/api/v2/Login?_format=json") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("multipart/form-data; boundary=CuriousWorld", forHTTPHeaderField: "Content-Type")
////        multipart/form-data; boundary=CuriousWorld
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else {
//            return }
//        request.httpBody = paramData
//
//        let session = URLSession.shared
//
//        print("============%@", parameters)
//        print("============%@", request.allHTTPHeaderFields)
//
//        session.dataTask(with: request) { (data, response, error) in
//            if let response = response {
//                print(response)
//            }
//
//            if let data = data {
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
//                        print("json \(json)")
//
//                        if let userData = json["data"] as? [String:Any]{
//                            print(userData)
//                            guard let firstName = userData["firstName"] as? String else {return}
//                            print("=========================== \(firstName)")
//                            self.fname = firstName
//                            guard let lastName = userData["lastName"] as? String else {return}
//                            print("=========================== \(lastName)")
//                            self.lname = lastName
//                        }
//                        if let statusMessage = json["status"] as? [String:Any]{
//                            print(statusMessage)
//                            guard let codeResponse = statusMessage["code"] as? Int else {return}
//                            print("=========================== \(codeResponse)")
//                            self.mainCode = codeResponse
//                            DispatchQueue.main.async {
//                                self.navigate()
//                            }
//                        }
//                    }
//                } catch {
//                    print(error)
//                }
//            }
//
//        }.resume()
//    }
//
    func navigate() {
        if(mainCode == 1)
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let contoller = storyboard.instantiateViewController(withIdentifier: "welcomeUser")
            self.navigationController?.pushViewController(contoller,animated: true)
        }
    }
    
    

    
//    {
//    NSMutableData *body = [NSMutableData data];
//    for (id key in dictionary)
//    {
//    NSString *keyString = [key description];
//    NSString *valueString = [[dictionary objectForKey:key] description];
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundryForWeb] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=%@\r\n\r\n", keyString] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"%@\r\n", valueString] dataUsingEncoding:NSUTF8StringEncoding]];
//    }
//    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundryForWeb] dataUsingEncoding:NSUTF8StringEncoding]];
//
//    return body;
//    }
//
//
     func validation() {
        if(emailValidationCode == 1)
        {            DispatchQueue.main.async {
            

            self.userView.validationImage.image = UIImage(named: "tick.png")
            self.flag = self.flag + 1
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.callback), userInfo: nil, repeats: false)
            }
        }
        else {
            
            DispatchQueue.main.async { 
                self.userView.validationImage.image = UIImage(named: "cross.png")
                self.toastLabel.toast(message: "\(self.emailMessage!)")
            }
        }
    }
    
    @objc func callback() {
        print("done")
        userView.isHidden = true
        nextButton.isHidden = true
        passwordView.isHidden = false
        nextButtonOfPasswordView.isHidden = false
        passwordView.emailDisplayButton.setTitle(userView.emailTextField.text, for: .normal)
    }
    
    @objc func onClickImageDisplayButton()
    {
        userView.isHidden = false
        nextButton.isHidden = false
        passwordView.isHidden = true
        nextButtonOfPasswordView.isHidden = true
    }
    
    @objc func onClickForgetButton()
    {
        let mail = userView.emailTextField.text
        let parameters = ["mail" : mail ]
        guard let url = URL(string: "https://qa.curiousworld.com/api/v2/ForgetPassword?_format=json") else { return }
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
                        if let statusCode = json["status"] as? [String:Any]{
                            print(statusCode)
                            guard let codeResponseOfEmail = statusCode["code"] as? Int else {return}
                            print("=========================== \(codeResponseOfEmail)")
                            self.forgotCode = codeResponseOfEmail
                        }
                        if let statusMessage = json["status"] as? [String:Any]{
                            print(statusMessage)
                            guard let codeResponseMessageOfEmail = statusMessage["message"] as? String else {return}
                            print("=========================== \(codeResponseMessageOfEmail)")
                            self.forgotMessage = codeResponseMessageOfEmail
                            DispatchQueue.main.async {
                                self.toastLabel.toast(message: "\(self.forgotMessage!)")
                            }
                        }
                    }
                } catch {
                    print(error)
                }
            }
            
            }.resume()
        print(emailValidationCode)
        print(emailMessage)
        
    }
    
    @IBAction func onClickNextButtonOfPasswordView(_ sender: Any) {
        
        if(passwordView.passwordTextField.text! == passwordView.reTypePasswordTextField.text!)
        {
            passwordView.validationImage.image = UIImage(named: "tick.png")
        }
        else {
            passwordView.validationImage.image = UIImage(named: "cross.png")
        }
        let mail = userView.emailTextField.text!
        let password = passwordView.passwordTextField.text!
        let parameters = ["mail" : mail ,
                          "password" : password,
                          "client_secret" : "abcde12345",
                          "client_id" : "ec7c3bde-9f51-4113-9ecf-6ca6fd03b66b",
                          "scope" : "ios",
                          "grant_type" : "password"]
        
        func getPostData(params:[String:String]) -> Data
        {
            var data = Data()
            for(key, value) in params
            {
                let string = "--CuriousWorld\r\n".data(using: .utf8)
                data.append(string!)
                data.append(String.init(format: "Content-Disposition: form-data; name=%@\r\n\r\n", key).data(using: .utf8)!)
                data.append(String.init(format: "%@\r\n", value).data(using: .utf8)!)
                data.append(String.init(format: "--CuriousWorld--\r\n").data(using: .utf8)!)
            }
            return data
        }
        
        let paramData = getPostData(params: parameters)
        guard let url = URL(string: "https://qa.curiousworld.com/api/v2/Login?_format=json") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("multipart/form-data; boundary=CuriousWorld", forHTTPHeaderField: "Content-Type")
        //        multipart/form-data; boundary=CuriousWorld
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else {
            return }
        request.httpBody = paramData
        
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
                        
                        if let userData = json["data"] as? [String:Any]{
                            print(userData)
                            guard let firstName = userData["firstName"] as? String else {return}
                            print("=========================== \(firstName)")
                            self.fname = firstName
                            guard let lastName = userData["lastName"] as? String else {return}
                            print("=========================== \(lastName)")
                            self.lname = lastName
                        }
                        if let statusMessage = json["status"] as? [String:Any]{
                            print(statusMessage)
                            guard let codeResponse = statusMessage["code"] as? Int else {return}
                            print("=========================== \(codeResponse)")
                            self.mainCode = codeResponse
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
    }
    
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        passwordView.validationImage.image = nil
        userView.validationImage.image = nil
    }
    @IBAction func onClickClickHere(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "SignUpVC")
        self.navigationController?.pushViewController(contoller,animated: true)
        
    }
}
