//
//  Question3.swift
//  iOSAssignment8-UIKit - Nested Controllers & Storyboard
//
//  Created by Utkarsh Patel on 09/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class Question3: UIViewController {

    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Question 3"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCilickNext() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "Question4")
        self.navigationController?.pushViewController(contoller,animated: true)
    }
}
