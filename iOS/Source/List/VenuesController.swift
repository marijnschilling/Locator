import UIKit
import DATASource
import CoreData
import MapKit

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
        self.tableView.registerClass(VenuesHeader.self, forHeaderFooterViewReuseIdentifier: VenuesHeader.Identifier)
        self.tableView.dataSource = self.dataSource
    }

    func i() {
        let fetchRequest = NSFetchRequest(entityName: Venue.entityName())
        let venues = try! self.fetcher.context.executeFetchRequest(fetchRequest) as! [Venue]
        for (index, venue) in venues.enumerate() {
            if let latitudeString = venue.latitude, longitudeString = venue.longitude {
                let latitude = (latitudeString as NSString).doubleValue
                let longitude = (longitudeString as NSString).doubleValue
                let location = CLLocation(latitude: latitude, longitude: longitude)
                let distance = userLocation.distanceFromLocation(location)
                print(distance)
            }
        }

        // sorting based on distance
        // NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"distance" ascending:YES];
        // [displayObject sortUsingDescriptors:@[descriptor]];
    }
}

extension VenuesController {
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(35)
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier(VenuesHeader.Identifier) as? VenuesHeader
        header?.textLabel?.text = self.dataSource.titleForHeaderInSection(section)
        return header
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

extension VenuesController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let venue = self.dataSource.objectAtIndexPath(indexPath) as! Venue
        let venueController = VenueController(venue: venue)
        self.navigationController?.pushViewController(venueController, animated: true)
    }
}