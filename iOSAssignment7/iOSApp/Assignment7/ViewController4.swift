//
//  ViewController4.swift
//  Assignment7
//
//  Created by Utkarsh Patel on 03/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    
    @IBOutlet var prevOf4: UIButton!
    @IBOutlet var nxtOf4: UIButton!
    @IBOutlet var presentON4: UIButton!
    @IBOutlet var labelOf4: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Page4"

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
    
    @IBAction func onCLickNxt() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "ViewController5")
        self.navigationController?.pushViewController(contoller,animated: true)
    }
    
    @IBAction func onClickPresent() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "PresentedViewController")
        contoller.modalPresentationStyle = .formSheet
       // self.navigationController?.pushViewController(contoller,animated: true)
        self.navigationController?.present(contoller, animated: true)
        
    }

}
