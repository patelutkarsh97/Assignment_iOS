//
//  Question4.swift
//  autoLayout
//
//  Created by Utkarsh Patel on 08/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class Question4: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Question 4"
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
    
    @IBAction func onClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "Question5")
        self.navigationController?.pushViewController(contoller,animated: true)
    }


}
