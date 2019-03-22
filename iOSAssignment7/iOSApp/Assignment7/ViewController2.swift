//
//  ViewController2.swift
//  Assignment7
//
//  Created by Utkarsh Patel on 03/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet var prevOf2: UIButton!
    @IBOutlet var nxtOf2: UIButton!
    @IBOutlet var labelOf2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Page2"

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
    
    @IBAction func onClickPrev() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickNxt() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "ViewController3")
        self.navigationController?.pushViewController(contoller,animated: true)
    }

}
