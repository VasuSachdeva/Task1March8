//
//  Person+CoreDataProperties.swift
//  Task1March8
//
//  Created by MAC on 08/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var email: String?

}
