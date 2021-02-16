//
//  ViewController.swift
//  SmartList App
//
//  Created by Rochelle Scott on 16/02/2021.
//

import UIKit

class SmartListViewController: UITableViewController {

    var itemArray = ["Buy gift","Send text","Cook dinner"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

// MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SmartListItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell //cell is returned to table view and displayed as a row.
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row]) //prints item from array into console.
        

        //check if current cell has checkmark, if so, change it to none (i.e.remove) else if no checkmark, add checkmark.
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true) //makes cell selection flash grey instead of staying grey.
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Task Item", message: "", preferredStyle: .alert)
        
        let actionButton = UIAlertAction(title: "Add Item", style: .default) { (actionButton) in
            // What will happen once the user clicks the Add Item button on out UIALert.
            //print(textField.text) //prints text that user enters to the console.
            
            self.itemArray.append(textField.text!) //Adds what user wrote in the textfield.
            self.tableView.reloadData() //reloads the table and shows the updated table on UI.
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(actionButton)
        
        present(alert, animated: true, completion: nil)
    }
}

