//
//  TabBarController.swift
//  EndGame
//
//  Created by Utkarsh Patel on 20/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import Foundation
import UIKit
import LBTAComponents
import RevealingSplashView
import NVActivityIndicatorView

class TabBarController: UITabBarController, NVActivityIndicatorViewable {
    
    var activityIndicatorView : NVActivityIndicatorView?
    var testView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100.0, height: 100.0), type: .ballPulse, color: .lightGray)
    }
    
    @objc func stopAnimationOfActivity() {
        activityIndicatorView?.stopAnimating()
        self.testView.removeFromSuperview()
    }
    
}

extension TabBarController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // This method will be called when user changes tab.
        let testFrame : CGRect = CGRect(x: 0.0, y: 0.0,width: self.view.bounds.width, height: self.view.bounds.height)
        testView = UIView(frame: testFrame)
        testView.backgroundColor = UIColor.black
        testView.alpha = 0.5
        self.view.addSubview(testView)
        
        self.testView.addSubview(activityIndicatorView!)
       // activityIndicatorView?.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        activityIndicatorView?.center = self.view.center
        activityIndicatorView?.startAnimating()
        self.perform(#selector(stopAnimationOfActivity), with: nil, afterDelay: 1.5)
    }
}
