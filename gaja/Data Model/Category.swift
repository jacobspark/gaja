//
//  Category.swift
//  gaja
//
//  Created by Jacob Park on 2/6/19.
//  Copyright © 2019 Jacob Park. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Data>()
}
