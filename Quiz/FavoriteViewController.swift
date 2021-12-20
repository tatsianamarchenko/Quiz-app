//
//  FavoriteViewController.swift
//  Quiz
//
//  Created by Tatsiana Marchanka on 20.12.21.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {

static let share = FavoriteViewController()
  var favorite = [FavoriteQuestions]()

  @IBOutlet weak var table: UITableView!
  override func viewDidLoad() {
        super.viewDidLoad()
    table.delegate = self
    table.dataSource = self
    }

  @IBAction func updateData(_ sender: UIButton) {
    table.reloadData()
    print(FavoriteViewController.share.favorite)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return FavoriteViewController.share.favorite.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
 // update()
    cell.textLabel?.text = FavoriteViewController.share.favorite[indexPath.row].question
    return cell
  }

}
