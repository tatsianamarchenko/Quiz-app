//
//  QuizModel.swift
//  Quiz
//
//  Created by Tatsiana Marchanka on 20.12.21.
//

import Foundation

// MARK: - QuizElement
struct QuizElement: Codable {
    let id: Int
    let question: String
///    let welcomeDescription: JSONNull?
    let answers: Answers
    let multipleCorrectAnswers: String
    let correctAnswers: CorrectAnswers
    let correctAnswer, explanation: String?
///    let tip: JSONNull?
///    let tags: [Tag]
    let category: Category
    let difficulty: Difficulty

    enum CodingKeys: String, CodingKey {
      case id, question
      ///        case welcomeDescription = "description"
      case answers
      case multipleCorrectAnswers = "multiple_correct_answers"
      case correctAnswers = "correct_answers"
      case correctAnswer = "correct_answer"
      case explanation
///      case tip, tags
      case category, difficulty
    }
}

// MARK: - Answers
struct Answers: Codable {
    let answerA, answerB, answerC, answerD: String
    let answerE, answerF: String?

    enum CodingKeys: String, CodingKey {
        case answerA = "answer_a"
        case answerB = "answer_b"
        case answerC = "answer_c"
        case answerD = "answer_d"
        case answerE = "answer_e"
        case answerF = "answer_f"
    }
}

enum Category: String, Codable {
  case bash = "BASH"
  case kubernetes = "Kubernetes"
  case linux = "Linux"
  case sql = "SQL"
  case uncategorized = "uncategorized"
  case docker = "Docker"
  case cms = "CMS"
  case code = "Code"
  case devops = "DevOps"
  
}

// MARK: - CorrectAnswers
struct CorrectAnswers: Codable {
    let answerACorrect, answerBCorrect, answerCCorrect, answerDCorrect: String
    let answerECorrect, answerFCorrect: String

    enum CodingKeys: String, CodingKey {
        case answerACorrect = "answer_a_correct"
        case answerBCorrect = "answer_b_correct"
        case answerCCorrect = "answer_c_correct"
        case answerDCorrect = "answer_d_correct"
        case answerECorrect = "answer_e_correct"
        case answerFCorrect = "answer_f_correct"
    }
}

enum Difficulty: String, Codable {
    case easy = "Easy"
}

// MARK: - Tag
///struct Tag: Codable {
///    let name: Category
///}

typealias Welcome = [QuizElement]

// MARK: - Encode/decode helpers

///class JSONNull: Codable, Hashable {
///
///    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
///        return true
///    }
///
///    public var hashValue: Int {
///        return 0
///    }
///
///    public init() {}
///
///    public required init(from decoder: Decoder) throws {
///        let container = try decoder.singleValueContainer()
///        if !container.decodeNil() {
///            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
///        }
///    }
///
///    public func encode(to encoder: Encoder) throws {
///        var container = encoder.singleValueContainer()
///        try container.encodeNil()
///    }
///}
