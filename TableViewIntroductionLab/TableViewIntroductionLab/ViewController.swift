//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//MARK: Outlets and properties
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var taskList = [[Task]]() {
        didSet { // property observer, gets called when continents is changed or set
            tableView.reloadData() // reloads contents of the tableview when ever continents is changed
    }
        
 
    }
// MARK: viewcontroller life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        loadData()
    }

    func loadData() {
           taskList = Task.getSections() // array of arrays
           }
    
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)

        let task = taskList[indexPath.section][indexPath.row]

        cell.textLabel?.text = task.name

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy h:mm a zzzz"
        let dateAsString = dateFormatter.string(from: task.dueDate)



        cell.detailTextLabel?.text = dateAsString

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return taskList.count // should be 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let status = taskList[section].first?.status.rawValue else {
            return "xyz"
        }
        return status
    }
    
}
    






