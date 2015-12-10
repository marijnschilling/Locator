import UIKit
import DATASource
import CoreData

class VenuesController: BaseTableViewController {
    lazy var dataSource: DATASource = {
        let request = NSFetchRequest(entityName: "Venue")
        request.sortDescriptors = [
            NSSortDescriptor(key: "title", ascending: true),
            NSSortDescriptor(key: "city", ascending: true)
        ]
        let dataSource = DATASource(tableView: self.tableView!, cellIdentifier: VenueCell.Identifier, fetchRequest: request, mainContext: self.fetcher.context, sectionName: "city", configuration: { cell, item, indexPath in
            if let cell = cell as? VenueCell, venue = item as? Venue {
                cell.venue = venue
            }
        })

        dataSource.delegate = self

        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Venues"
        self.tableView.registerClass(VenueCell.self, forCellReuseIdentifier: VenueCell.Identifier)
        self.tableView.dataSource = self.dataSource

        self.fetcher.stubPosts()

        self.fetcher.posts { error in

        } 
    }
}

extension VenuesController: DATASourceDelegate {
    func sectionIndexTitlesForDataSource(dataSource: DATASource, tableView: UITableView) -> [String] {
        return [String]()
    }
}

extension VenuesController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let venue = self.dataSource.objectAtIndexPath(indexPath) as! Venue
        let venueController = VenueController(venue: venue)
        self.navigationController?.pushViewController(venueController, animated: true)
    }
}