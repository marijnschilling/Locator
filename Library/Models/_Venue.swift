// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Venue.swift instead.

import Foundation
import CoreData

public enum VenueAttributes: String {
    case address = "address"
    case city = "city"
    case imageURL = "imageURL"
    case latitude = "latitude"
    case longitude = "longitude"
    case name = "name"
    case neverEnding = "neverEnding"
    case remoteID = "remoteID"
    case venueDescription = "venueDescription"
}

public class _Venue: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Venue"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Venue.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var address: String?

    @NSManaged public
    var city: String?

    @NSManaged public
    var imageURL: String?

    @NSManaged public
    var latitude: NSNumber?

    @NSManaged public
    var longitude: NSNumber?

    @NSManaged public
    var name: String?

    @NSManaged public
    var neverEnding: NSNumber?

    @NSManaged public
    var remoteID: NSNumber?

    @NSManaged public
    var venueDescription: String?

    // MARK: - Relationships

}

