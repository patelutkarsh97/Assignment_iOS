//
//  ViewController.swift
//  EndGame
//
//  Created by Utkarsh Patel on 20/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import LBTAComponents
import RevealingSplashView

class ViewController: UIViewController {

    let revealingSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "AvengerLogo"), iconInitialSize: CGSize(width: 123, height: 123), backgroundColor: UIColor.white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarViewController()
    }
    
    func setupView() {
        revealingSplashView.animationType = .rotateOut
        revealingSplashView.duration = 1.5
        view.addSubview(revealingSplashView)
        revealingSplashView.startAnimation()
        
    }
    
   // @objc
    func setupTabbarViewController() {
         if (UserDefaults.standard.bool(forKey: "FirstTime") == false) {
            setupView()
            self.perform(#selector(splashForVc), with: nil, afterDelay: 1.5)
            
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let welcomeViewController = UIStoryboard.init(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "WelcomeScreenVC")
//        appDelegate.window?.rootViewController = welcomeViewController
        } else {
            setupView()
            self.perform(#selector(splashForTabBar), with: nil, afterDelay: 1.5)
            
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            let tabbarViewController = UIStoryboard.init(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "TabBarController")
//            appDelegate.window?.rootViewController = tabbarViewController
        }
    }
    @objc func splashForVc() {
        setupView()
        self.perform(#selector(vc), with: nil, afterDelay: 0)
    }
    @objc func splashForTabBar() {
        setupView()
        self.perform(#selector(welcome), with: nil, afterDelay: 0)
    }
    @objc func vc() {
        view.isHidden = true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let welcomeViewController = UIStoryboard.init(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "WelcomeScreenVC")
        appDelegate.window?.rootViewController = welcomeViewController
    }
    @objc func welcome() {
        view.isHidden = true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let tabbarViewController = UIStoryboard.init(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "TabBarController")
        appDelegate.window?.rootViewController = tabbarViewController
    }
}
