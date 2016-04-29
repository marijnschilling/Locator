import Foundation
import DATAStack
import Networking
import Sync

public class Fetcher {
    private var data: DATAStack
    private var networking: Networking

    // MARK: - Initializers

    init(baseURL: String, modelName: String) {
        self.data = DATAStack(modelName: modelName)
        self.networking = Networking(baseURL: baseURL)
    }

    // MARK: - Public methods

    public func persistWithCompletion(completion: () -> ()) {
        data.persistWithCompletion(completion)
    }

    public func stubPosts() {
        self.networking.fakeGET("/items", fileName: "original.json")
    }

    public func posts(completion: (error: NSError?) -> ()) {
        self.networking.GET("/items") { JSON, error in
            if let JSON = JSON as? NSDictionary {
                let items = JSON.normalize() as! [[String : AnyObject]]
                Sync.changes(items, inEntityNamed: "Venue", dataStack: self.data, completion: { error in
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