//
//  RecipeVC.swift
//  iOSAssignment23-CoreData
//
//  Created by Utkarsh Patel on 10/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit
import CoreData
class AddOrUpdateRecipeVC: UIViewController,  NSFetchedResultsControllerDelegate {

    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var recipeOriginTextField: UITextField!
    @IBOutlet weak var recipeMadeBy: UITextField!
    @IBOutlet weak var recipeMakingTimeTextField: UITextField!
    @IBOutlet weak var recipeIngredientsTextView: UITextView!
    @IBOutlet weak var favouriteSwitch: UISwitch!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    var updateRecipe: String = ""
    var recipeToBeUpdated = false
    
    fileprivate lazy var fetchResultController : NSFetchedResultsController<MyRecipe> =
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
    
    fileprivate lazy var fetchedResultControllerUpdater: NSFetchedResultsController<MyRecipe> = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest = MyRecipe.fetchRequest()
        let predicate = NSPredicate(format: "nameOfRecipe == %@", updateRecipe)
        fetchRequest.predicate = predicate
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "nameOfRecipe", ascending: false)]
        let fetchedResultControllerUpdater = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context!, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultControllerUpdater.delegate = self
        
        try! fetchedResultControllerUpdater.performFetch()
        return fetchedResultControllerUpdater
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        textFieldReturnKeyFormatting()
        recipeNameTextField.becomeFirstResponder()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddOrUpdateRecipeVC.viewTapped(gestureRecogniser:)))
        view.addGestureRecognizer(tapGesture)
        
        if recipeToBeUpdated {
            let updateRecipe = fetchedResultControllerUpdater.fetchedObjects?.first
            recipeNameTextField.text = updateRecipe?.nameOfRecipe
            recipeOriginTextField.text = updateRecipe?.originOfRecipe
            recipeMadeBy.text = updateRecipe?.recipeOwner
            recipeMakingTimeTextField.text = updateRecipe?.preparationTime
            recipeIngredientsTextView.text = updateRecipe?.recipeIngredient
            if updateRecipe!.myFav {
                favouriteSwitch.isOn = true
            }
            else {
                favouriteSwitch.isOn = false
            }
        }
    }
    @objc func viewTapped(gestureRecogniser: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Recipe Information"
    }
    @IBAction func onClickReset(_ sender: Any) {
        recipeNameTextField.text! = ""
        recipeOriginTextField.text! = ""
        recipeMadeBy.text! = ""
        recipeMakingTimeTextField.text! = ""
        recipeIngredientsTextView.text! = ""
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickSave(_ sender: Any) {
        if recipeToBeUpdated {
            updateIntoCoreData()
        }
        else {
            insertIntoCoreData()
        }
        self.navigationController?.popViewController(animated: true)
    }
}

extension AddOrUpdateRecipeVC {
    
    func insertIntoCoreData() {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    if let context = appDelegate?.persistentContainer.viewContext {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "MyRecipe", into: context) as? MyRecipe
        entity?.nameOfRecipe = recipeNameTextField.text
        entity?.originOfRecipe = recipeOriginTextField.text
        entity?.recipeOwner = recipeMadeBy.text
        entity?.preparationTime = recipeMakingTimeTextField.text
        entity?.recipeIngredient = recipeIngredientsTextView.text
        entity?.myFav = favouriteSwitch.isOn
        appDelegate?.saveContext()
        }
}

    func updateIntoCoreData() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let updateRecipe = fetchedResultControllerUpdater.fetchedObjects?.first
        let context = appDelegate?.persistentContainer.viewContext
        updateRecipe?.setValue(recipeNameTextField.text, forKey: "nameOfRecipe")
        updateRecipe?.setValue(recipeOriginTextField.text, forKey: "originOfRecipe")
        updateRecipe?.setValue(recipeMadeBy.text, forKey: "recipeOwner")
        updateRecipe?.setValue(recipeMakingTimeTextField.text, forKey: "preparationTime")
        updateRecipe?.setValue(recipeIngredientsTextView.text, forKey: "recipeIngredient")
        updateRecipe?.setValue(favouriteSwitch.isOn, forKey: "myFav")
        try? context?.save()
        recipeToBeUpdated = false
        }
    }
    
extension AddOrUpdateRecipeVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    func textFieldReturnKeyFormatting() {
        recipeNameTextField.delegate = self
        recipeNameTextField.tag = 0
        recipeOriginTextField.delegate = self
        recipeOriginTextField.tag = 1
        recipeMadeBy.delegate = self
        recipeMadeBy.tag = 2
        recipeMakingTimeTextField.delegate = self
        recipeMakingTimeTextField.tag = 3
//        recipeIngredientsTextView.delegate = self
//        recipeIngredientsTextView.tag = 4
    }
}
