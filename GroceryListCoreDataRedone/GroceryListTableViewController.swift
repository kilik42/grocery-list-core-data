//
//  GroceryListTableViewController.swift
//  GroceryListCoreDataRedone
//
//  Created by marvin evins on 6/21/20.
//  Copyright © 2020 websavantmedia. All rights reserved.
//

import UIKit

class GroceryListTableViewController: UITableViewController {
    
    var groceries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBAction func addAction(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Grocery Item", message: "what to by now ", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField: UITextField) in
            
        }
        
        
        let addAction = UIAlertAction(title: "Add", style: UIAlertAction.Style.default) {[weak self] ( action: UIAlertAction) in
            let textField = alertController.textFields?.first
            self?.groceries.append(textField!.text!)
            self?.tableView.reloadData()
            
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
        
        cell.textLabel?.text = self.groceries[indexPath.row]
        return cell
        
    }
  
}
