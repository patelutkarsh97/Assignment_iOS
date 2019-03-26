//
//  Question2.swift
//  autoLayout
//
//  Created by Utkarsh Patel on 08/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class Question2: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var round: UIButton!
     @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Question 2"

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
    @IBAction func setRoundC() {
        image.layer.cornerRadius = CGFloat(image.frame.size.width/2)
    }
    
    @IBAction func onClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "Question3")
        self.navigationController?.pushViewController(contoller,animated: true)
    }

}
