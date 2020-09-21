//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Juan Francisco Dorado Torres on 21/09/20.
//

import UIKit

class ChecklistViewController: UITableViewController {
  let row0text = "Walk the dog"
  let row1text = "Brush teeth"
  let row2text = "Learn iOS development"
  let row3text = "Soccer practice"
  let row4text = "Eat ice cream"
  var row0checked = false
  var row1checked = false
  var row2checked = false
  var row3checked = false
  var row4checked = false

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
    var isChecked = false
    if indexPath.row == 0 {
      row0checked = !row0checked
      isChecked = row0checked
    } else if indexPath.row == 1 {
      row1checked = !row1checked
      isChecked = row1checked
    } else if indexPath.row == 2 {
      row2checked = !row2checked
      isChecked = row2checked
    } else if indexPath.row == 3 {
      row3checked = !row3checked
      isChecked = row3checked
    } else if indexPath.row == 4 {
      row4checked = !row4checked
      isChecked = row4checked
    }

    if isChecked {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
  }

  // MARK: - Table View Data Source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)

    if let label = cell.viewWithTag(1000) as? UILabel {
      if indexPath.row == 0 {
        label.text = row0text
      } else if indexPath.row == 1 {
        label.text = row1text
      } else if indexPath.row == 2 {
        label.text = row2text
      } else if indexPath.row == 3 {
        label.text = row3text
      } else if indexPath.row == 4 {
        label.text = row4text
      }
    }

    return cell
  }

  // MARK: - Table View Delegate
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as! UITableViewCell
    configureCheckmark(for: cell, at: indexPath)
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
