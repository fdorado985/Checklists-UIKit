//
//  Checklist.swift
//  Checklists
//
//  Created by Juan Francisco Dorado Torres on 27/09/20.
//

import Foundation

class Checklist: NSObject, Codable {
  var name: String
  var iconName: String
  var items: [ChecklistItem]

  init(name: String, iconName: String = "No Icon") {
    self.name = name
    self.iconName = iconName
    items = [ChecklistItem]()
    super.init()
  }

  func countUncheckedItems() -> Int {
    return items.reduce(0) { $0 + ($1.checked ? 0 : 1) }
  }
}
