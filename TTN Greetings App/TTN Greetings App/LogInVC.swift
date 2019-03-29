//
//  LogInVC.swift
//  TTN Greetings App
//
//  Created by Utkarsh Patel on 18/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class LogInVC: UIViewController, ActivityIndicating {
    var flag = 0
    @IBOutlet weak var passwordToastLabel: UILabel!
    @IBOutlet weak var emailToastLabel: UILabel!
    @IBOutlet weak var toastLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var facebookLoginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonFormatting()
        loginButton.roundButton()
        facebookLoginButton.roundButton()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LogInVC.viewTapped(gestureRecogniser:)))
        view.addGestureRecognizer(tapGesture)
        
    }
    @objc func viewTapped(gestureRecogniser: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func emailCheck()
    {
        
            let valid = emailTextField.emailValidation(email: self.emailTextField.text!)
            if(valid == false)
            {
                emailToastLabel.toast(message: "Incorrect Email..........")
                flag = flag + 1
            }
            else {
                flag = 0
        }
        
        
    }
    func passwordCheck() {
        let valid = passwordTextField.passwordValidation(password: passwordTextField.text!)
        
        if(valid == false)
        {
            passwordToastLabel.toast(message: "Use strong password......")
            flag = flag + 1
        }
        else {
            flag = 0
        }
    }
    @IBAction func onClickLoginButton(_ sender: Any) {
       showActivityIndicator()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(callback), userInfo: nil, repeats: false)
    }
    @objc func callback() {
        print("done")
        if (userArray.isEmpty) {
            toastLabel.toast(message: "SignUp to get access")
        }
            for i in userArray
            {
                if (flag == 0 && emailTextField.text ==  i.email && passwordTextField.text == i.password  )
                {
                    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "WelcomePageVC") as? WelcomePageVC
            contoller?.userType = i
                    self.navigationController?.pushViewController(contoller!,animated: true)
                    
                    loginUser(userName: emailTextField.text!)
                    let user = UserDefaults.standard.string(forKey: emailTextField.text!)
                    let alertMessage = "Welcome ! \(user!)"
                    let alert = UIAlertController(title: nil, message: alertMessage, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Go", style: .default, handler: nil))
                    self.present(alert, animated:  true)
        }
                else {
                    hideActivityIndicator()
                    toastLabel.toast(message: "Invalid Email-Id or Password")
                }
                
        }
        
    }
    
    @IBAction func onClickFacebookButton(_ sender: Any) {
        toastLabel.toast(message: " Redirecting to facebook.. ")
    }
    func buttonFormatting() {
        loginButton.layer.cornerRadius = 0.2 * loginButton.bounds.size.width
        facebookLoginButton.layer.cornerRadius = 0.2 * facebookLoginButton.bounds.size.width
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.layer.cornerRadius = 0.07 * emailTextField.bounds.size.width
        passwordTextField.layer.cornerRadius = 0.07 * passwordTextField.bounds.size.width
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        
    }

  

}
// MARK: QUESTION 2
protocol Toasting {
    func toast(message : String)
}

extension UILabel : Toasting
{
    
    func toast(message: String)  {
        self.isHidden = false
        self.backgroundColor = UIColor.brown.withAlphaComponent(0.6)
        self.textColor = UIColor.yellow
        self.textAlignment = .center
        self.font = UIFont(name: "Chalkduster", size: 20.0)
        self.text = message
        self.alpha = 1.0
        self.layer.cornerRadius = 10
        self.clipsToBounds  =  true
        UIView.animate(withDuration: 7.0, delay: 0.0, options: .transitionCurlUp, animations: {
            self.alpha = 0.0
        }, completion: {(isCompleted) in
           // self.isHidden = true
        })
    }
}
// MARK : QUESTION 7
protocol Validating {
     func emailValidation(email: String) -> Bool
     func passwordValidation(password: String) -> Bool
}

extension UITextField : Validating {
    func emailValidation(email : String) -> Bool
    {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func passwordValidation(password : String) -> Bool
    {
      let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        print(passwordTest)
        print(password)
        return passwordTest.evaluate(with: password)
    }
}


protocol LoggableProtocol  {
    
    func loginUser(userName : String)
    func logoutUser(userName : String)
    
}

extension LoggableProtocol
{
    func loginUser(userName : String)
    {
        UserDefaults.standard.set(userName, forKey: userName )
    }
    
    func logoutUser(userName : String)
    {
        UserDefaults.standard.removeObject(forKey: userName )
        
    }
}

extension LogInVC : LoggableProtocol {}


