//
//  DesignableScroll.swift
//  gaja
//
//  Created by Jacob Park on 2/8/19.
//  Copyright © 2019 Jacob Park. All rights reserved.
//

import UIKit

@IBDesignable class DesignableScroll: UIScrollView {

    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
