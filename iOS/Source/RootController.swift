import UIKit
import DATASource
import CoreData

class RootController: BaseTableViewController {
    lazy var dataSource: DATASource = {
        let request = NSFetchRequest(entityName: "Item")
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        let dataSource = DATASource(tableView: self.tableView!, cellIdentifier: "Cell", fetchRequest: request, mainContext: self.fetcher.context, configuration: { cell, item, indexPath in
            cell.textLabel?.text = item.valueForKey("title") as? String
        })

        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        self.tableView.dataSource = self.dataSource

        self.fetcher.posts { error in

        }
    }
}
