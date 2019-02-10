//
//  ChooseTableViewController.swift
//  gaja
//
//  Created by Jacob Park on 2/9/19.
//  Copyright © 2019 Jacob Park. All rights reserved.
//

import UIKit
import RealmSwift

class ChooseTableViewController: CategoryTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! MapViewController
        
//        if let indexPath = tableView.indexPathForSelectedRow {
//            destinationVC.selectedCategory = categories?[indexPath.row]
//        }
    }
}
