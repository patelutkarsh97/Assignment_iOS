//
//  RecipeVC.swift
//  iOSAssignment23-CoreData
//
//  Created by Utkarsh Patel on 10/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import CoreData

class RecipeVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    fileprivate lazy var fetchedResultController : NSFetchedResultsController<MyRecipe> =
    {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest = MyRecipe.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "nameOfRecipe", ascending: true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context!, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        try! fetchResultController.performFetch()
        return fetchResultController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Recipe"
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.navigationBar.topItem?.title = "Recipe"
    }
    
}

extension RecipeVC : UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (fetchedResultController.fetchedObjects?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = fetchedResultController.object(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
        cell.textLabel?.text = data.nameOfRecipe
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let record = fetchedResultController.object(at: indexPath)
//        UserDefaults.standard.set(record.nameOfRecipe, forKey: "nameOfRecipe")
        
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AddOrUpdateRecipeVC") as! AddOrUpdateRecipeVC
        controller.updateRecipe = record.nameOfRecipe!
        controller.recipeToBeUpdated = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate?.persistentContainer.viewContext
            let recipe = fetchedResultController.object(at: indexPath)
            context!.delete(recipe)
            do {
                try! context!.save()
                print("Record Saved")
                
            }
            catch {
                print("Got Error")
            }
        }
    }
}

extension RecipeVC : NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
}
