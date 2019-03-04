//
//  ViewController.swift
//  Assignment7
//
//  Created by Utkarsh Patel on 03/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label: String = "This is the content of ViewController 1"
    @IBOutlet var button1: UIButton!
    @IBOutlet var labelof1: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Page1"
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func onclick() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "ViewController2")
        self.navigationController?.pushViewController(contoller,animated: true)
    }    

}


