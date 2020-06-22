//
//  Grocery+CoreDataProperties.swift
//  GroceryListCoreDataRedone
//
//  Created by marvin evins on 6/22/20.
//  Copyright © 2020 websavantmedia. All rights reserved.
//
//

import Foundation
import CoreData


extension Grocery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Grocery> {
        return NSFetchRequest<Grocery>(entityName: "Grocery")
    }

    @NSManaged public var item: String?

}
