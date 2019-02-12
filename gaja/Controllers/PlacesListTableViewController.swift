//
//  PlacesListTableViewController.swift
//  gaja
//
//  Copyright © 2019 Jacob Park. All rights reserved.
//

import UIKit
import RealmSwift

class PlacesListTableViewController: SwipeTableViewController {

    var places: Results<Data>?
    let realm = try! Realm()
    
    var selectedCategory : Category? {  // Passed in through segue
        didSet {
            loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = places?[indexPath.row] {
            
            cell.textLabel?.text = item.title
        }
        else {
            cell.textLabel?.text = "None added"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let item = places?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(item)
                }
            } catch {
                print("Error deleting Item, \(error)")
            }
        }
    }

    func loadItems() {
        places = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new location", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add a new place", style: .default) { (action) in
        
        if let currentCategory = self.selectedCategory {
            do {
                try self.realm.write {
                    let newItem = Data()
                    newItem.title = textField.text!
                    currentCategory.items.append(newItem)
                }
            }
            catch {
                print("Error, cannot save new items \(error)")
                
            }
        }
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add a place"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

}
