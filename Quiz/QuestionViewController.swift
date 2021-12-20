//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Tatsiana Marchanka on 20.12.21.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
static let share = QuestionViewController()
  var array = [QuizElement]()
  var answers = [String]()
  var correct = [String]()
  var singleCorrectAnswer : Int?

  @IBOutlet weak var question: UILabel!
  @IBOutlet weak var table: UITableView!

  override func viewDidLoad() {
        super.viewDidLoad()
    webRequest()
    }

  func webRequest () {
    let selectedTopic = ViewController.share.selected
    let url = "https://quizapi.io/api/v1/questions?apiKey=o30pQFHGU6ewyOINV19AmLriI2kViIyBPW1pE2ff&category=\(selectedTopic)&difficulty=Easy&limit=1"
    print(url)
    let servise = APIService(urlString: url)
    servise.getJSON { (result: Result<[QuizElement], APIError>) in
      switch result {
      case .success(let result):
        DispatchQueue.main.async { [self] in
          array = result
          question.text = array[0].question
          /// print(array[0].question)
          print(array[0].answers)
          print(array[0].correctAnswers)
          // correct answers
          correct.removeAll()
          correct.append(array[0].correctAnswers.answerACorrect)
          correct.append(array[0].correctAnswers.answerBCorrect)
          correct.append(array[0].correctAnswers.answerCCorrect)
          correct.append(array[0].correctAnswers.answerDCorrect)
          correct.append(array[0].correctAnswers.answerECorrect)
          correct.append(array[0].correctAnswers.answerFCorrect)
          for (index, _) in correct.enumerated() {
            if correct[index] == "true"
            {singleCorrectAnswer = index
              print(singleCorrectAnswer!)
            }
          }
          // answers
          answers.removeAll()
          answers.append(array[0].answers.answerA)
          answers.append(array[0].answers.answerB)
          answers.append(array[0].answers.answerC)
          answers.append(array[0].answers.answerD)
          answers.append(array[0].answers.answerE ?? "")
          answers.append(array[0].answers.answerF ?? "")
            table.reloadData()

          // вынесены сюда тк долго загружаются ответы
          table.delegate = self
          table.dataSource = self
        }
      case .failure(let error):
        print(error)
      }
    }
  }
var favoriteque = ["ebedv", "sbv", "befdsdvz"]
  @IBAction func favoriteButton(_ sender: UIBarButtonItem) {
    var quest = FavoriteQuestions(question:  array[0].question)
    FavoriteViewController.share.favorite.append(quest)
    print(FavoriteViewController.share.favorite)
  }
  var errorArray = ["problems with network"]
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return answers.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    if answers.isEmpty {
      print(answers)
      cell.textLabel?.text = errorArray[indexPath.row]
    }
    else {
      cell.textLabel?.text = answers[indexPath.row]
    }
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    let selectedAnswer = indexPath.row

      if singleCorrectAnswer == selectedAnswer {
        print("норм")
        table.backgroundColor = .systemMint
        DispatchQueue.main.async {
          self.webRequest()
        }
      } else {
        table.backgroundColor = .systemPink
      }
  }

}

struct FavoriteQuestions {
  var question : String
}
