//
//  ViewController.swift
//  iOSAssignment 16 - Notification
//
//  Created by Utkarsh Patel on 05/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class Question1: UIViewController, DataPassingDelegate {

    @IBOutlet weak var onClickFillDetails: UIButton!
    @IBOutlet weak var fullDetailsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickFillDetails(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "NameVC") as? NameVC
        controller!.delegate = self
        self.navigationController?.pushViewController(controller!,animated: true)
    }
    
    func passData(dataDict: [String : String]) {
        print(dataDict)
        fullDetailsLabel.text? = "Name: \(dataDict["name"]!)\nAge: \(dataDict["age"]!)\nParent's Name: \(dataDict["parents"]!)"
            print(dataDict)
        }
    }


