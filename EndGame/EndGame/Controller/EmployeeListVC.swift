//
//  ViewController.swift
//  EndGame
//
//  Created by Utkarsh Patel on 19/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
var cellIndex: IndexPath?
var employeeAge: String?
var employeeSalary: String?
var employeeName: String?
class EmployeeListVC: UIViewController {
     @IBOutlet var searchFooter: SearchFooter!
     let url = "http://dummy.restapiexample.com/api/v1/employees"
    var detailViewController: DetailVC? = nil
    var result = [Employee]()
    var filteredResult = [Employee]()
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        let nib = UINib.init(nibName: "customTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
        callApi()
        setupNavBar()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Employee"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Setup the Scope Bar
      //  searchController.searchBar.scopeButtonTitles = ["All"]
       // searchController.searchBar.delegate = self
        
        // Setup the search footer
        tableView.tableFooterView = searchFooter
        
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailVC
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if splitViewController!.isCollapsed {
//            if let selectionIndexPath = tableView.indexPathForSelectedRow {
//                tableView.deselectRow(at: selectionIndexPath, animated: animated)
//            }
//        }
//        super.viewWillAppear(animated)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if isFiltering() {
//            searchFooter.setIsFilteringToShow(filteredItemCount: filteredResult.count, of: result.count)
//            return filteredResult.count
//        }
//
//        searchFooter.setNotFiltering()
//        return result.count
//    }
//

    
    func  callApi(){
        DispatchQueue.global().async {
            
            ConnectivityVC.loadEmployeeData(urlString: self.url) {(employeeList, responseErr) in
                if let err = responseErr {
                    debugPrint(err.localizedDescription)
                }
                else
                {
                    self.result = employeeList as! Array<Employee>
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}
extension EmployeeListVC : UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            searchFooter.setIsFilteringToShow(filteredItemCount: filteredResult.count, of: result.count)
            return filteredResult.count
        }
        
        searchFooter.setNotFiltering()
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! customTableCell
        let emp: Employee
        if isFiltering() {
            emp = filteredResult[indexPath.row]
        } else {
            emp = result[indexPath.row]
        }
        cell.nameLabel.text = result[indexPath.row].employee_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        employeeAge = result[indexPath.row].employee_age
        employeeSalary = result[indexPath.row].employee_salary
        employeeName = result[indexPath.row].employee_name
        cellIndex = indexPath
        //employeeAge = result[indexPath.row].employee_age
        
         self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // using animation for displaying cell
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 0.8) {
            cell.transform = CGAffineTransform.identity
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
//        cell.nameLabel.backgroundColor = UIColor.green
//        let storyboard = UIstoryboard(name: "Main", bundle: nil)
//        controller = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC
//        empID = result[indexPath.row].id
//        // print(type(of: cellIndex))
//        self.cellIndex = indexPath
//        self.empID = self.result[indexPath.row].id
//        controller!.setEmployeeId(indexId: empID!)
//        self.navigationController?.pushViewController(controller!, animated: true)
//    }
    
    // MARK: - Private instance methods
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredResult = result.filter({( emp : Employee) -> Bool in
            let doesCategoryMatch = (scope == "All") || (emp.employee_name == scope)
            
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && emp.employee_name.lowercased().contains(searchText.lowercased())
            }
        })
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
//        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        tableView.reloadData()
    }
}

//extension EmployeeListVC: UISearchBarDelegate {
//    // MARK: - UISearchBar Delegate
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
//    }
//}

extension EmployeeListVC: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
//        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!)//, scope: scope)
    }
}
