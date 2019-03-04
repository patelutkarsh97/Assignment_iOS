//
//  ViewController3.swift
//  Assignment7
//
//  Created by Utkarsh Patel on 03/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet var prevOf3: UIButton!
    @IBOutlet var nxtOf3: UIButton!
    @IBOutlet var labelOf3: UILabel!
    @IBOutlet var goToButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Page3"

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
    
    @IBAction func onClickprev() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickNxt() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "ViewController4")
        self.navigationController?.pushViewController(contoller,animated: true)
    }
    
    @IBAction func onClickGoTo() {
        
    
    let navArray = self.navigationController?.viewControllers
    let goto = navArray![0]
    self.navigationController?.popToViewController(goto, animated: true)
    }

}
