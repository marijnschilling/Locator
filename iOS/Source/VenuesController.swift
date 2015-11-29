import UIKit
import DATASource
import CoreData

class VenuesController: BaseTableViewController {
    lazy var dataSource: DATASource = {
        let request = NSFetchRequest(entityName: "Item")
        request.sortDescriptors = [
            NSSortDescriptor(key: "title", ascending: true),
            NSSortDescriptor(key: "city", ascending: true)
        ]
        let dataSource = DATASource(tableView: self.tableView!, cellIdentifier: "Cell", fetchRequest: request, mainContext: self.fetcher.context, sectionName: "city", configuration: { cell, item, indexPath in
            cell.textLabel?.text = item.valueForKey("title") as? String
        })

        dataSource.delegate = self

        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Venues"
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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