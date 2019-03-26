//
//  ViewController.swift
//  autoLayout
//
//  Created by Utkarsh Patel on 08/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Question 1"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "Question2")
        self.navigationController?.pushViewController(contoller,animated: true)
    }


}

