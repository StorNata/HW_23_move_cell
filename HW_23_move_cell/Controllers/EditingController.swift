//
//  EditingController.swift
//  HW_23_move_cell
//
//  Created by Nataliia Storozheva on 27.05.2020.
//  Copyright © 2020 Nataliia Storozheva. All rights reserved.
//

import UIKit

class EditingController: TableViewController {
    @IBOutlet private var editButton: UIBarButtonItem!
    
    override func setup() {
        super.setup()
        title = "HW_23 Move Cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.title = tableView?.isEditing == false ? "Edit" : "Done"
    }
    
    //MARK: - Action
    @IBAction private func changeTableViewState() {
        if let isEditing = tableView?.isEditing {
            tableView?.setEditing(!isEditing, animated: true)
        }
        editButton.title = tableView?.isEditing == false ? "Edit" : "Done"
    }
    
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
    
    //MARK: - Move Cell
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // change dataSource
        let model = dataSource[sourceIndexPath.row]
        dataSource.remove(at: sourceIndexPath.row)
        dataSource.insert(model, at: destinationIndexPath.row)
    }
}
