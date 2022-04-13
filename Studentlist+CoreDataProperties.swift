//
//  Studentlist+CoreDataProperties.swift
//  internProject
//
//  Created by Pavan D J on 11/04/22.
//
//

import Foundation
import CoreData


extension Studentlist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Studentlist> {
        return NSFetchRequest<Studentlist>(entityName: "Studentlist")
    }

    @NSManaged public var branch: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?

}

extension Studentlist : Identifiable {

}
