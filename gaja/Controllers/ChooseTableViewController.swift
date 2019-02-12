//
//  ChooseTableViewController.swift
//  gaja
//
//  Copyright © 2019 Jacob Park. All rights reserved.
//

import UIKit
import RealmSwift

class ChooseTableViewController: CategoryTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }

    // Override functions for segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! MapViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {  // Passes data only in selected category
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
}
