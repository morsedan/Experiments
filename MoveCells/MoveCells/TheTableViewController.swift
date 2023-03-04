//
//  TheTableViewController.swift
//  MoveCells
//
//  Created by Morse on 9/21/22.
//

import UIKit

class TheTableViewController: UITableViewController {
    
    var cells = ["One", "Two", "Three", "Four", "Five"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ExpandingTableViewCell.self, forCellReuseIdentifier: ExpandingTableViewCell.reuseID)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Size", for: .normal)
        button.backgroundColor = .systemPink
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpandingTableViewCell.reuseID, for: indexPath) as? ExpandingTableViewCell else { return UITableViewCell() }

        cell.title = cells[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedCell = cells.remove(at: fromIndexPath.row)
        cells.insert(movedCell, at: to.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let expandableItemCell = tableView.cellForRow(at: indexPath) as? ExpandingTableViewCell else { return }
        expandableItemCell.toggleSize()
        
        tableView.reloadData()
    }
}

extension TheTableViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = cells[indexPath.row]
        return [dragItem]
    }
}
