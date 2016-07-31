//
//  Product+CoreDataProperties.swift
//  r3piShopping
//
//  Created by Sean Denton on 7/31/16.
//  Copyright © 2016 Sean Denton. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Product {

    @NSManaged var title: String?
    @NSManaged var unit: String?
    @NSManaged var price: NSDecimalNumber?
    @NSManaged var desc: String?
    @NSManaged var image: NSData?
    @NSManaged var imageURL: String?

}
