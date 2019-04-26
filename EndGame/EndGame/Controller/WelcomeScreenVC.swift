//
//  WelcomeScreenVC.swift
//  EndGame
//
//  Created by Utkarsh Patel on 20/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import LBTAComponents
import RevealingSplashView

class WelcomeScreenVC: UIViewController {
    
    @IBOutlet weak var iDisagreeButton: UIButton!
    @IBOutlet weak var iAgreeButton: UIButton!
    @IBOutlet weak var subView: UIScrollView!
    
    
    let revealingSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "AvengerLogo"), iconInitialSize: CGSize(width: 123, height: 123), backgroundColor: UIColor.white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupView()
        // Do any additional setup after loading the view.
        
        //self.perform(#selector(setupTabbarViewController), with: nil, afterDelay: 1.5)
    }
    
    @IBAction func onClickDisagreeButton(_ sender: Any) {
        
            UIView.animate(withDuration: 1.0) {
                self.iDisagreeButton.backgroundColor = UIColor(red:1.00, green:0.61, blue:0.56, alpha:1.0)
                self.iDisagreeButton.setTitleColor(.black, for: .normal)
            }
        self.perform(#selector(exitApp), with: nil, afterDelay: 1.5)
    }
    
    @IBAction func onClickAgreeButton(_ sender: Any) {
        UIView.animate(withDuration: 1.0) {
            self.iAgreeButton.backgroundColor = UIColor(red:0.86, green:0.93, blue:0.76, alpha:1.0)
            self.iAgreeButton.setTitleColor(.black, for: .normal)
            UserDefaults.standard.set(true, forKey: "FirstTime")
        }
        self.perform(#selector(splash), with: nil, afterDelay: 1.5)
    }
    
    @objc func exitApp() {
        Darwin.exit(0)
    }

    @objc func splash() {
        setupView()
        self.perform(#selector(nextController), with: nil, afterDelay: 1.5)
    }
    
    @objc func nextController() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let tabbarViewController = UIStoryboard.init(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "TabBarController")
        appDelegate.window?.rootViewController = tabbarViewController
    }
    
    func setupView() {
        
        view.addSubview(revealingSplashView)
        revealingSplashView.startAnimation()
        subView.isHidden = true
    }

//    @objc func setupTabbarViewController() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        let tabbarViewController = UIStoryboard.init(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "TabBarController")
//        appDelegate.window?.rootViewController = tabbarViewController
//    }
    
}
