//
//  ViewController.swift
//  Quiz
//
//  Created by Tatsiana Marchanka on 20.12.21.
//

import UIKit

class ViewController: UIViewController {

 static let share = ViewController()
  var selected = "linux"
  var tableContent = ["linux","bash", "uncategorized", "docker", "sql", "cms", "code", "devops"]
  @IBOutlet weak var table: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    table.dataSource = self
    table.delegate = self
  }

  
  @IBAction func startQuiz(_ sender: UIButton) {
  }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableContent.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = tableContent[indexPath.row]
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      table.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
    selected = tableContent[indexPath.row]
    print(selected)
  }

  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
      table.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
  }

}
