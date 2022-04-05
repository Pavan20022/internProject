//
//  Studentlist+CoreDataProperties.swift
//  
//
//  Created by Pavan D J on 05/04/22.
//
//

import Foundation
import CoreData


extension Studentlist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Studentlist> {
        return NSFetchRequest<Studentlist>(entityName: "Studentlist")
    }

    @NSManaged public var name: String?
    @NSManaged public var cgpa: String?
    @NSManaged public var usn: String?
    @NSManaged public var branch: String?

}
