//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Juan Francisco Dorado Torres on 22/09/20.
//

import UIKit

class AddItemViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.largeTitleDisplayMode = .never
  }

  // MARK: - Actions
  @IBAction func cancel() {
    navigationController?.popViewController(animated: true)
  }

  @IBAction func done() {
    navigationController?.popViewController(animated: true)
  }
}
