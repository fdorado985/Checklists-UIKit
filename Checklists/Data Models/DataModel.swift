//
//  DataModel.swift
//  Checklists
//
//  Created by Juan Francisco Dorado Torres on 28/09/20.
//

import Foundation

class DataModel {
  var lists = [Checklist]()

  var indexOfSelectedChecklist: Int {
    get {
      return UserDefaults.standard.integer(forKey: "ChecklistIndex")
    }
    set {
      UserDefaults.standard.set(newValue, forKey: "ChecklistIndex")
    }
  }

  init() {
    loadChecklists()
    registerValues()
    handleFirstTime()
  }

  // MARK: - Data Saving
  func documentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }

  func dataFilePath() -> URL {
    return documentsDirectory().appendingPathComponent("Checklists.plist")
  }

  func saveChecklists() {
    let encoder = PropertyListEncoder()
    do {
      let data = try encoder.encode(lists)
      try data.write(to: dataFilePath(), options: .atomic)
    } catch {
      print("Error encoding list array: \(error.localizedDescription)")
    }
  }

  func loadChecklists() {
    let path = dataFilePath()
    if let data = try? Data(contentsOf: path) {
      let decoder = PropertyListDecoder()
      do {
        lists = try decoder.decode([Checklist].self, from: data)
      } catch {
        print("Error decoding list array: \(error.localizedDescription)")
      }
    }
  }

  func registerValues() {
    let dictionary: [String: Any] = ["ChecklistIndex": -1, "FirstTime": true]
    UserDefaults.standard.register(defaults: dictionary)
  }

  func handleFirstTime() {
    let userDefaults = UserDefaults.standard
    let firstTime = userDefaults.bool(forKey: "FirstTime")

    if firstTime {
      let checklist = Checklist(name: "List")
      lists.append(checklist)

      indexOfSelectedChecklist = 0
      userDefaults.set(false, forKey: "FirstTime")
      userDefaults.synchronize()
    }
  }
}
