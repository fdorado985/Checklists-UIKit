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

  init(text: String, checked: Bool = false) {
    self.text = text
    self.checked = checked
    super.init()
  }

  func toggleChecked() {
    checked.toggle()
  }
}
