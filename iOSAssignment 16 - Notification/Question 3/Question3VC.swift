//
//  Question3VC.swift
//  iOSAssignment 16 - Notification
//
//  Created by Utkarsh Patel on 05/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import UserNotifications

class Question3VC: UIViewController {
    @IBOutlet weak var notificationTitleTextField: UITextField!
    @IBOutlet weak var notificationMessageTextField: UITextField!
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    @IBOutlet weak var notificationTimeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func scheduleNotification() {
        
        let notification = UNMutableNotificationContent()
        let timeIntervalForNotification = Int(notificationTimeTextField.text!)! * 60
        notification.title = notificationTitleTextField.text!
        notification.body = notificationMessageTextField.text!
        notification.sound = UNNotificationSound(named: .init(rawValue: "Soda.m4r"))
        notification.badge = 1
        let imageName = "bell"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        let notificationAttachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        notification.attachments = [notificationAttachment]
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(timeIntervalForNotification), repeats: true)
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notification, trigger: notificationTrigger)
        
        if notificationSwitch.isOn == true {
            UNUserNotificationCenter.current().add(notificationRequest) { (error) in
                print(error?.localizedDescription)
            }
        }
        else {
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            
            // for local notification when app is in foreground
            completionHandler([.alert, .badge, .sound])
        }
    }
}
