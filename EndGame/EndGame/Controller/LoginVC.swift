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
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        passwordView.validationImage.image = nil
        userView.validationImage.image = nil
    }
}
