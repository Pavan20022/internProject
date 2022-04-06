//
//  Studentlist+CoreDataProperties.swift
//  internProject
//
//  Created by Pavan D J on 06/04/22.
//
//

import Foundation
import CoreData


extension Studentlist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Studentlist> {
        return NSFetchRequest<Studentlist>(entityName: "Studentlist")
    }

    @NSManaged public var branch: String?
    @NSManaged public var cgpa: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var usn: String?

}

extension Studentlist : Identifiable {

}
