//
//  TabBarController.swift
//  iOSAssignment23-CoreData
//
//  Created by Utkarsh Patel on 10/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Recipe"
    }
    
    @IBAction func addButton() {
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AddOrUpdateRecipeVC") as! AddOrUpdateRecipeVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func logout() {
        UserDefaults.standard.removeObject(forKey: "login")
        self.navigationController?.popToRootViewController(animated: true)
    }
}


