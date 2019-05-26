//
//  SignInView.swift
//  EndGame
//
//  Created by Utkarsh Patel on 26/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class SignInView: UIView {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var validationImage: UIImageView!
    
        override init(frame: CGRect) {
        super.init(frame: frame)
        registerNib()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        registerNib()
    }
    
    private func registerNib() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "SignInView", bundle: bundle)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
            self.addSubview(view)
        }
    }
    @IBAction func onClickNextButton(_ sender: Any) {
        let valid = emailTextField.emailValidation(email: self.emailTextField.text!)
        if(valid == false)
        {
            validationImage.image = UIImage(named: "cross.png")
        }
        else {
            validationImage.image = UIImage(named: "tick.png")
        }
    }
}

protocol Validating {
    func emailValidation(email: String) -> Bool
    // func passwordValidation(password: String) -> Bool
}

extension UITextField : Validating {
    func emailValidation(email : String) -> Bool
    {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}
