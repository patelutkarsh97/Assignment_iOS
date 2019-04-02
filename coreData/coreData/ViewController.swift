//
//  ViewController.swift
//  coreData
//
//  Created by Utkarsh Patel on 02/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let result = fetchResultController.fetchedObjects
            else {return 0}
        return result.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let fruitName = fetchResultController.object(at: indexPath)
        cell?.textLabel?.text = fruitName.fruitName
        return cell!
    }

    
    @IBAction func onClickAddBar(_ sender: Any) {
        let alert = UIAlertController(title: "Fruit", message: "Enter Fruit", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            self.saveRecipe(name : nameToSave)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func saveRecipe(name : String)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Fruits", in: context)
        let fruitName = NSManagedObject(entity: entity!, insertInto: context)
        fruitName.setValue(name, forKeyPath: "fruitName")
        do
        {
            try context.save()
        }
        catch let error as NSError
        {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    
        
        // MARK : For Inserting in coreData
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        fileURL[fileURL.count-1]
        print(fileURL)

        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext {
            let entity1 = NSEntityDescription.insertNewObject(forEntityName: "Fruits", into: context) as? Fruits
            entity1?.fruitName = "Mango"
            let entity2 = NSEntityDescription.insertNewObject(forEntityName: "Fruits", into: context) as? Fruits
            entity2?.fruitName = "Apple"
//            let entity3 = NSEntityDescription.insertNewObject(forEntityName: "Fruits", into: context) as? Fruits
//            entity3?.fruitName = "Grapes"
//            let entity4 = NSEntityDescription.insertNewObject(forEntityName: "Fruits", into: context) as? Fruits
//
//            entity4?.fruitName = "Pineapple"
//            let entity5 = NSEntityDescription.insertNewObject(forEntityName: "Fruits", into: context) as? Fruits
//            entity5?.fruitName = "Orange"
//            let entity6 = NSEntityDescription.insertNewObject(forEntityName: "Fruits", into: context) as? Fruits
//            entity6?.fruitName = "Kiwi"
//            let entity7 = NSEntityDescription.insertNewObject(forEntityName: "Fruits", into: context) as? Fruits
//            entity7?.fruitName = "Apple"
//            let entity8 = NSEntityDescription.insertNewObject(forEntityName: "Fruits", into: context) as? Fruits
//            entity8?.fruitName = "Watermelon"
//            let entity9 = NSEntityDescription.insertNewObject(forEntityName: "Fruits", into: context) as? Fruits
//            entity9?.fruitName = "Melon"
//            let entity10 = NSEntityDescription.insertNewObject(forEntityName: "Fruits", into: context) as? Fruits
//            entity10?.fruitName = "Strawberry"
//
//            let entity11 = NSEntityDescription.insertNewObject(forEntityName: "Vegetables", into: context) as? Vegetables
//            entity11?.vegName = "Tomato"
//            let entity12 = NSEntityDescription.insertNewObject(forEntityName: "Vegetables", into: context) as? Vegetables
//            entity12?.vegName = "Potato"
//            let entity13 = NSEntityDescription.insertNewObject(forEntityName: "Vegetables", into: context) as? Vegetables
//            entity13?.vegName = "Garlic"
//            let entity14 = NSEntityDescription.insertNewObject(forEntityName: "Vegetables", into: context) as? Vegetables
//            entity14?.vegName = "Cucumber"
//            let entity15 = NSEntityDescription.insertNewObject(forEntityName: "Vegetables", into: context) as? Vegetables
//            entity15?.vegName = "Onion"
//            let entity16 = NSEntityDescription.insertNewObject(forEntityName: "Vegetables", into: context) as? Vegetables
//            entity16?.vegName = "LadyFinger"
//            let entity17 = NSEntityDescription.insertNewObject(forEntityName: "Vegetables", into: context) as? Vegetables
//            entity17?.vegName = "Cabbage"
//            let entity18 = NSEntityDescription.insertNewObject(forEntityName: "Vegetables", into: context) as? Vegetables
//            entity18?.vegName = "Cauliflower"
//            let entity19 = NSEntityDescription.insertNewObject(forEntityName: "Vegetables", into: context) as? Vegetables
//            entity19?.vegName = "Beanes"
//            let entity20 = NSEntityDescription.insertNewObject(forEntityName: "Vegetables", into: context) as? Vegetables
//            entity20?.vegName = "Peas"
            appDelegate?.saveContext()
        }
    }
    
    // MARK : For Displaying in TableView
    fileprivate lazy var fetchResultController: NSFetchedResultsController<Fruits> = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate?.persistentContainer.viewContext
            let fetchRequest: NSFetchRequest = Fruits.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "fruitName", ascending: true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context!, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self as? NSFetchedResultsControllerDelegate
            try! fetchResultController.performFetch()
            return fetchResultController
            tableView.reloadData()
        }()
//
    // MARK : For Deleting the record
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate?.persistentContainer.viewContext
            let fruit = fetchResultController.object(at: indexPath)
            context!.delete(fruit)
            do {
                try! context?.save()
                
            }
            catch {
                print("Got Error")
            }
        }
    }
    
    }

extension ViewController : NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
}
