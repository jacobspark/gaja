//
//  ViewController.swift
//  gaja
//
//  Copyright © 2019 Jacob Park. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        // navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // For gradient in background
//    func setGradient() {
//        let gradient = CAGradientLayer()
//        gradient.frame = view.frame
//        view.layer.insertSublayer(gradient, at: 0)
//    }
    
}

