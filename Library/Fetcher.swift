import Foundation
import DATAStack
import Networking
import Sync
import CoreData

class Fetcher {
    var data: DATAStack
    var networking: Networking

    init(baseURL: String, modelName: String) {
        self.data = DATAStack(modelName: modelName)
        self.networking = Networking(baseURL: baseURL)
        self.networking.fakeGET("/venues", fileName: "venues.json")
    }

    func posts(completion: (error: NSError?) -> ()) {
        self.networking.GET("/venues") { JSON, error in
            if let JSON = JSON as? [String : AnyObject], venues = JSON["venues"] as? [[String : AnyObject]] {
                Sync.changes(venues, inEntityNamed: "Venue", dataStack: self.data, completion: { error in
                    completion(error: error)
                })
            } else {
                completion(error: error)
            }
        }
    }

    var context: NSManagedObjectContext {
        return self.data.mainContext
    }
}