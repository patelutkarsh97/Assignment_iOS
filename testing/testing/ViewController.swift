//
//  ViewController.swift
//  testing
//
//  Created by Utkarsh Patel on 13/06/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
struct CrewMember {
    var expanded: Bool
    
    init(expanded: Bool) {
        self.expanded = false
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var crewMembers = [CrewMember]()
    @IBOutlet weak var tableView: UITableView!
    var expand = false
    override func viewDidLoad() {
        super.viewDidLoad()
//        let nib = UINib(nibName: "TableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "cell")
        let stackNib = UINib(nibName: "StackTableViewCell", bundle: nil)
        tableView.register(stackNib, forCellReuseIdentifier: "stackCell")

        //clearsSelectionOnViewWillAppear = false
        //tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "stackCell") as! StackTableViewCell
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if expand {
//            return 183
//        } else {
//            return 50
//        }
//    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        expand = true
        tableView.reloadData()
    }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    private func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    
    // MARK: - UITableViewDelegate
    
    private func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        var indexPathToReturn: NSIndexPath?
        var crewMember = crewMembers[indexPath.row]
        
        if crewMember.expanded {
            crewMember.expanded = false
            
            tableView.deselectRow(at: indexPath as IndexPath, animated: true)
            self.tableView(tableView: tableView, didDeselectRowAtIndexPath: indexPath)
        } else {
            crewMember.expanded = true
            indexPathToReturn = indexPath
        }
        
        crewMembers[indexPath.row] = crewMember
        
        return indexPathToReturn
    }
    
    
}

