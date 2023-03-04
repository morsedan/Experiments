//
//  ViewController.swift
//  ChatGPTExpandableCell
//
//  Created by Morse on 2/8/23.
//

import UIKit

struct CellData {
    let title: String
    let image: UIImage
    var isExpanded: Bool
}

class TableViewController: UITableViewController {
    var dataSource = [
        CellData(title: "Item 1", image: UIImage(systemName: "pencil")!, isExpanded: false),
        CellData(title: "Item 2", image: UIImage(systemName: "pencil")!, isExpanded: false),
        CellData(title: "Item 3", image: UIImage(systemName: "pencil")!, isExpanded: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollapsableTableViewCell", for: indexPath) as! CollapsableTableViewCell
        
        let data = dataSource[indexPath.row]
        cell.label.text = data.title
        cell.arrowImageView.image = data.image
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCellTap(sender:)))
        cell.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
    }
    
    @objc func handleCellTap(sender: UITapGestureRecognizer) {
        if let cell = sender.view as? CollapsableTableViewCell {
            if let indexPath = tableView.indexPath(for: cell) {
                dataSource[indexPath.row].isExpanded = !dataSource[indexPath.row].isExpanded
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if dataSource[indexPath.row].isExpanded {
            return 120
        } else {
            return 60
        }
    }
}

