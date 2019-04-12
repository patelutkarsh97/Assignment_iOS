//
//  NameVC.swift
//  iOSAssignment 16 - Notification
//
//  Created by Utkarsh Patel on 05/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

protocol DataPassingDelegate {
    
    func passData(dataDict:[String:String])
}


class NameVC: UIViewController {
    var delegate : DataPassingDelegate?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var parentNameTextField: UITextField!
    @IBOutlet weak var onClickSubmit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onClickSubmit(_ sender: Any) {
        let dict = ["name": nameTextField.text!, "age": ageTextField.text!, "parents": parentNameTextField.text!]
        print(dict)
        if delegate != nil {
            delegate?.passData(dataDict: dict)
        }
        self.navigationController?.popToRootViewController(animated: false)
    }
}




