import UIKit
import DATASource
import CoreData

class VenuesController: BaseTableViewController {
    lazy var dataSource: DATASource = {
        let request = NSFetchRequest(entityName: Venue.entityName())
        request.sortDescriptors = [
            NSSortDescriptor(key: VenueAttributes.city.rawValue, ascending: true),
            NSSortDescriptor(key: VenueAttributes.name.rawValue, ascending: true)
        ]
        let dataSource = DATASource(tableView: self.controllerView, cellIdentifier: VenueCell.Identifier, fetchRequest: request, mainContext: self.fetcher.viewContext, sectionName: VenueAttributes.city.rawValue) { cell, item, indexPath in
            if let cell = cell as? VenueCell, venue = item as? Venue {
                cell.venue = venue
            }
        }

        dataSource.delegate = self

        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Venues"
        self.controllerView.registerClass(VenueCell.self, forCellReuseIdentifier: VenueCell.Identifier)
        self.controllerView.registerClass(VenuesHeader.self, forHeaderFooterViewReuseIdentifier: VenuesHeader.Identifier)
        self.controllerView.dataSource = self.dataSource
        self.controllerView.delegate = self
        self.controllerView.rowHeight = 60

        self.fetcher.posts { error in
            
        }
    }
}

extension VenuesController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(35)
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier(VenuesHeader.Identifier) as? VenuesHeader
        header?.textLabel?.text = self.dataSource.titleForHeaderInSection(section)
        return header
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let venue = self.dataSource.objectAtIndexPath(indexPath) as! Venue
        let venueController = VenueController(fetcher: self.fetcher, venue: venue)
        self.presentViewController(venueController, animated: true, completion: nil)
    }
}

extension VenuesController: DATASourceDelegate {
    func dataSource(dataSource: DATASource, tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }

    func sectionIndexTitlesForDataSource(dataSource: DATASource, tableView: UITableView) -> [String] {
        return [String]()
    }
}