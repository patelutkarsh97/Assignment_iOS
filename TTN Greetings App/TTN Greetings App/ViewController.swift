//
//  ViewController.swift
//  TTN Greetings App
//
//  Created by Utkarsh Patel on 18/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButton()
    }
    
    @IBAction func onClickSignUpButton(_ sender: Any) {
        let storyboards = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboards.instantiateViewController(withIdentifier: "SignUpVC")
        self.navigationController?.pushViewController(controller,animated: true)
    }
    @IBAction func onClickLoginButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "LogInVC")
        self.navigationController?.pushViewController(contoller,animated: true)
    }
    
}
// MARK: QUESTION 6
protocol Roundable
{
    func roundButton()
}

extension UIButton : Roundable
{
    func roundButton() {
        self.layer.cornerRadius = 0.2 * self.bounds.size.width
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
    }
}

extension ViewController : Roundable
{
    func roundButton() {
        loginButton.roundButton()
        signupButton.roundButton()
    }
    
    
}
