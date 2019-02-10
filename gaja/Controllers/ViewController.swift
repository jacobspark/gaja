//
//  ViewController.swift
//  gaja
//
//  Created by Jacob Park on 1/29/19.
//  Copyright © 2019 Jacob Park. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        //navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    @IBAction func favoriteLocationsButton(_ sender: UIButton) {
    }
    
}

