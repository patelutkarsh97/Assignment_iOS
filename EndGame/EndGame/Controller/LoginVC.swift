//
//  LoginVC.swift
//  EndGame
//
//  Created by Utkarsh Patel on 19/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,UITextFieldDelegate {
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
        //customNavBar.exitButton.addTarget(self, action: #selector(self.onClickExitButton), for: .touchUpInside)
        
        passwordView.reTypePasswordTextField.delegate = self
        passwordView.passwordTextField.delegate = self
        userView.emailTextField.delegate = self
    }
    
    @IBAction func onClickNextButton(_ sender: Any) {
        let valid = userView.emailTextField.emailValidation(email: userView.emailTextField.text!)
        if(valid == false)
        {
            userView.validationImage.image = UIImage(named: "cross.png")
            
        }
        else {
            userView.validationImage.image = UIImage(named: "tick.png")
            flag = flag + 1
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(callback), userInfo: nil, repeats: false)
        }
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
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
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
