//
//  toasting.swift
//  EndGame
//
//  Created by Utkarsh Patel on 30/05/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import Foundation
import UIKit

// MARK: Toasting
protocol Toasting {
    func toast(message : String)
}

extension UILabel : Toasting
{
    
    func toast(message: String)  {
        self.isHidden = false
        self.backgroundColor = UIColor.brown.withAlphaComponent(0.6)
        self.textColor = UIColor.yellow
        self.textAlignment = .center
        self.font = UIFont(name: "Chalkduster", size: 20.0)
        self.text = message
        self.alpha = 1.0
        self.layer.cornerRadius = 10
        self.clipsToBounds  =  true
        UIView.animate(withDuration: 7.0, delay: 0.0, options: .transitionCurlUp, animations: {
            self.alpha = 0.0
        }, completion: {(isCompleted) in
            // self.isHidden = true
        })
    }
}
