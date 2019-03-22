//
//  ViewController5.swift
//  Assignment7
//
//  Created by Utkarsh Patel on 03/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {
    
    @IBOutlet var prevOf5: UIButton!
    @IBOutlet var nxtOf5: UIButton!
    @IBOutlet var labelOf5: UILabel!
    @IBOutlet var labelOf1st: UILabel!
    @IBOutlet var exit: UIButton!
    
    var label = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Page5"
        
        
        let navarray = self.navigationController?.viewControllers
        let obj = navarray![0] as? ViewController
       // label.text = obj?.labelof1
        //print(label)
        print(obj!.label)
        
        self.labelOf1st.text = obj?.label
        print(label)
        
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
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onClickExit(segue: UIStoryboardSegue) {
        
        Darwin.exit(0)
        
    }
}
