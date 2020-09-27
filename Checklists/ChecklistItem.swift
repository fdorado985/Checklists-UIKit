//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Juan Francisco Dorado Torres on 21/09/20.
//

import Foundation

class ChecklistItem: NSObject, Codable {
  var text = ""
  var checked = false

  func toggleChecked() {
    checked.toggle()
  }
}
