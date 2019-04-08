//
//  secondVC.swift
//  iOSAssignment 16 - Notification
//
//  Created by Utkarsh Patel on 05/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
let notificationIdentifier = "notificatnotificationIdentifierionId"
class secondVC: UIViewController {
   @IBOutlet var messageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: notificationIdentifier),object: nil,queue: nil,
                                               using:catchNotification)
       
    }
    @objc func catchNotification(notification:Notification) -> Void {
        //guard let name = notification.userInfo!["key"] else { return }
    }
    @IBAction func onBroadcast(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationIdentifier), object: nil, userInfo: ["key": messageTextField.text!])
        self.navigationController?.popToRootViewController(animated: true)
    }

}
