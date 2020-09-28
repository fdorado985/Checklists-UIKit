//
//  Checklist.swift
//  Checklists
//
//  Created by Juan Francisco Dorado Torres on 27/09/20.
//

import Foundation

class Checklist: NSObject {
  var name: String
  var items = [ChecklistItem]()

  init(name: String) {
    self.name = name
    super.init()
  }
}
