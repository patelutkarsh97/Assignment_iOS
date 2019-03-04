//
//  PresentedViewController.swift
//  Assignment7
//
//  Created by Utkarsh Patel on 03/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {
    
    @IBOutlet var dismiss: UIButton!
    @IBOutlet var labelOfpresnt: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Presented"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func dismss() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
