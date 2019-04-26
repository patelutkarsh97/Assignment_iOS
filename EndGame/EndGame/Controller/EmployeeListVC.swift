//
//  ViewController.swift
//  EndGame
//
//  Created by Utkarsh Patel on 19/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class EmployeeListVC: UIViewController {

    let array = ["Utkarsh", "Akash", "Waseem", "Anuranjan", "Anubhav", "Ashish", "Anindya", "Abhishek", "Jasmeet"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        let nib = UINib.init(nibName: "customTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
        
        setupNavBar()
    }
}

extension EmployeeListVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! customTableCell
        
        cell.nameLabel.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
         self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        //navigationItem.largeTitleDisplayMode = .automatic
    }
}
