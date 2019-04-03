//
//  ViewController.swift
//  cocoa
//
//  Created by Utkarsh Patel on 22/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import Reachability

class ViewController: UIViewController {

    @IBOutlet weak var connectionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        isInternetAvailable()
    }
    
    func isInternetAvailable() -> Bool {
        let reachability: Reachability = Reachability(hostname: "www.google.com")!
        let networkStatus = reachability.connection
       // self.reach = Reachability.Connection
        if networkStatus == .none {
            print("No Connection")
            connectionLabel.text = "No Internet Connection"
            return false
        } else {
            print("Connection is available")
            connectionLabel.text = "Internet Connection is available"
            return true
        }
    }

}

