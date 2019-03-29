//
//  GreetingVC.swift
//  TTN Greetings App
//
//  Created by Utkarsh Patel on 27/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class GreetingVC: UIViewController {

    @IBOutlet weak var toastLabel: UILabel!
    @IBOutlet weak var greetingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingTableView.dataSource = self
        greetingTableView.delegate = self
        let nib = UINib.init(nibName: "GreetingTableViewCell", bundle: nil)
        greetingTableView.register(nib, forCellReuseIdentifier: "greetingTableCell")
        greetingTableView.reloadData()
    }
    

}
// MARK: QUESTION 8

extension GreetingVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell : GreetingTableViewCell =  tableView.dequeueReusableCell(withIdentifier: "greetingTableCell") as! GreetingTableViewCell
        cell.emailLabel.text = userArray[indexPath.row].email
        cell.nameLabel.text = userArray[indexPath.row].name
        cell.phoneLabel.text = String(userArray[indexPath.row].phone)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toastLabel.toast(message: "Greeting Send Successfully")
    }
    // set view for footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 10))
        footerView.backgroundColor = UIColor.yellow
        return footerView
    }
    
    // set height for footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
}


