//
//  GroceryListTableViewController.swift
//  GroceryListCoreDataRedone
//
//  Created by marvin evins on 6/21/20.
//  Copyright © 2020 websavantmedia. All rights reserved.
//

import UIKit
import CoreData

class GroceryListTableViewController: UITableViewController {
    
    var groceries = [Grocery]()
    var managedObjectContext: NSManagedObjectContext?
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        loadData()
        
        
    }

    
    func loadData(){
       // let request: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: "Grocery")
        let request: NSFetchRequest<Grocery> = Grocery.fetchRequest()
        
        
        do{
            let results = try managedObjectContext?.fetch(request)
            groceries = results!
            tableView.reloadData()
        }catch{
            fatalError("Error in retrieving Grocery Item")
        }
    }
    
    // MARK: - Table view data source

    @IBAction func addAction(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Grocery Item", message: "what to by now ", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField: UITextField) in
            
        }
        
        
        let addAction = UIAlertAction(title: "Add", style: UIAlertAction.Style.default) {[weak self] ( action: UIAlertAction) in
//            let textField = alertController.textFields?.first
//            //self?.groceries.append(textField!.text!)
//
//            let entity = NSEntityDescription.entity(forEntityName: "Grocery", in: (self?.managedObjectContext)!)
//            let grocery = NSManagedObject(entity: entity!, insertInto: self?.managedObjectContext)
//
//            grocery.setValue(textField!.text!, forKey: "item")
            
            let itemString : String?
            
            if(alertController.textFields?.first?.text != ""){
                itemString = alertController.textFields?.first?.text
            }
            else{
                return
            }
            
            let grocery = Grocery(context: (self?.managedObjectContext)!)
            grocery.item = itemString
            
            
            do{
                try self?.managedObjectContext?.save()
            }
            catch{
                fatalError("error in storing data")
            }
            
            
            self?.loadData()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groceries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath)
        
        let grocery = self.groceries[indexPath.row]
        cell.textLabel?.text = grocery.item
        return cell
        
    }
  
}
