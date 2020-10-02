//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Juan Francisco Dorado Torres on 21/09/20.
//

import Foundation

class ChecklistItem: NSObject, Codable {
  var text: String
  var checked: Bool
  var dueDate = Date()
  var shouldRemind = false
  var itemID = -1

  override init() {
    self.text = ""
    self.checked = false
    super.init()
    itemID = DataModel.nextChecklistItemID()
  }

  init(text: String, checked: Bool = false) {
    self.text = text
    self.checked = checked
    super.init()
  }

  func toggleChecked() {
    checked.toggle()
  }
}
