//
//  Segment.swift
//  Assignment9
//
//  Created by Utkarsh Patel on 10/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class Segment: UIViewController {
    
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

   
    @IBAction func segmentOption(_ sender: Any) {
        if segment.selectedSegmentIndex == 0 {
                       label.text = "Employee segment selected"
                  }
                  else {
                       label.text = "Employer segment selected"
                   }
    }

}
