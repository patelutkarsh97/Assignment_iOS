//
//  Question2.swift
//  iOSAssignment8-UIKit - Nested Controllers & Storyboard
//
//  Created by Utkarsh Patel on 09/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class Question2: UIViewController {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Question 2"
        
        modificationOfImage()
        
        
//        let myView = UIView(frame: rectangleView)
//        myView.backgroundColor = UIColor .red
//
        
            //.init(red: 244/255, green: 182/255, blue: 194/255, alpha: 1.0)
        
        // Do any additional setup after loading the view.
    }
//
//    let rectangleView = CGRect(x:10, y:10, width: 100, height: 100)
//
    
    func modificationOfImage() {
        
        subView.layer.borderWidth = 5
        subView.layer.borderColor = UIColor.init(red: 114/255, green: 19/255, blue: 239/255, alpha: 1) .cgColor
        
        subView.layer.shadowColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1) .cgColor
        subView.layer.cornerRadius = 30.0
        subView.layer.shadowOpacity = 100
        subView.layer.shadowRadius = 20.0
        
        
       // subView.layer.masksToBounds = true
            }
    
    @IBAction func onCilickNext() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contoller = storyboard.instantiateViewController(withIdentifier: "Question3")
        self.navigationController?.pushViewController(contoller,animated: true)
    }
    

}
