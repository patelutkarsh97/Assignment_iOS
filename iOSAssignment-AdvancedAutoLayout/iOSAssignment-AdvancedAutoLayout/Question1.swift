//
//  Question1.swift
//  iOSAssignment-AdvancedAutoLayout
//
//  Created by Utkarsh Patel on 15/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class Question1: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var verticalStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(Question1.viewTapped(gestureRecogniser:)))
        view.addGestureRecognizer(tapGesture)
        textFieldFormatting()
    }
    
    
    @objc func viewTapped(gestureRecogniser: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func onClick(_ sender: Any) {
        let subViewOfRed = UIView()
        let subViewOfGreen = UIView()
        let subViewOfYellow = UIView()
        let subViewOfBlue = UIView()
        let horizontalStackView1 = UIStackView()
        let horizontalStackView2 = UIStackView()

    subViewOfRed.backgroundColor = .red
    subViewOfGreen.backgroundColor = .green
    subViewOfYellow.backgroundColor = .yellow
    subViewOfBlue.backgroundColor = .blue
        horizontalStackView1.axis = .horizontal
        horizontalStackView1.distribution = .fillEqually
        horizontalStackView2.axis = .horizontal
        horizontalStackView2.distribution = .fillEqually
        
        for uiviews in verticalStackView.subviews{
            uiviews.removeFromSuperview()
        }


    let noOfViews = textField.text!

    if noOfViews == "1" {
        verticalStackView.addArrangedSubview(subViewOfRed)
    }

    else if noOfViews == "2" {
        verticalStackView.addArrangedSubview(subViewOfRed)
        verticalStackView.addArrangedSubview(subViewOfGreen)
    }

    else if noOfViews == "3" {
        verticalStackView.addArrangedSubview(subViewOfRed)
        verticalStackView.addArrangedSubview(subViewOfGreen)
        verticalStackView.addArrangedSubview(subViewOfYellow)
    }

    else if noOfViews == "4" {
        horizontalStackView1.addArrangedSubview(subViewOfRed)
        horizontalStackView1.addArrangedSubview(subViewOfGreen)
        horizontalStackView2.addArrangedSubview(subViewOfYellow)
        horizontalStackView2.addArrangedSubview(subViewOfBlue)
        verticalStackView.addArrangedSubview(horizontalStackView1)
        verticalStackView.addArrangedSubview(horizontalStackView2)
        }
        
    else {
        textField.text = "Range between 1 to 4"
        }
}
    func textFieldFormatting() {
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.init(red: 114/255, green: 19/255, blue: 239/255, alpha: 1) .cgColor
        textField.layer.cornerRadius = 5.0
        textField.layer.masksToBounds = true
    }
}
