//
//  Data.swift
//  gaja
//
//  Created by Jacob Park on 2/6/19.
//  Copyright © 2019 Jacob Park. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var title : String = ""
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
