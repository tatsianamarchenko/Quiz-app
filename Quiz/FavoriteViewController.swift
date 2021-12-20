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
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return FavoriteViewController.share.favorite.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
    cell.textLabel?.text = FavoriteViewController.share.favorite[indexPath.row].question
    return cell
  }

  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let action = UIContextualAction(style: .destructive, title: "delete") { action, view, complitionHandler in
      let questionForDelete = FavoriteViewController.share.favorite[indexPath.row]
      QuestionViewController.share.context.delete(questionForDelete)
      do {
        try  QuestionViewController.share.context.save()
      } catch  {
        print(error)
      }
      QuestionViewController.share.fetchFavoriteQ()
    }
    self.table.reloadData()
    return UISwipeActionsConfiguration(actions: [action])
  }

}
