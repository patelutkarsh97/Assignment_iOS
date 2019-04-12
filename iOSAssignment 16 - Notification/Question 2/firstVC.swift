//
//  firstVC.swift
//  iOSAssignment 16 - Notification
//
//  Created by Utkarsh Patel on 05/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class firstVC: UIViewController {

    @IBOutlet weak var broadcastLabel: UILabel!
    @IBOutlet weak var onClickMessageButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: notificationIdentifier),object: nil,queue: nil, using:catchNotification)
    }
    @objc func catchNotification(notification:Notification) -> Void {
         guard let message = notification.userInfo!["key"] else { return }
        broadcastLabel.text = " \(message)"
    }
    @IBAction func onClickNext(){
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "secondVC") as! secondVC
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
