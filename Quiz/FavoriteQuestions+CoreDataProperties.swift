//
//  FavoriteQuestions+CoreDataProperties.swift
//  Quiz
//
//  Created by Tatsiana Marchanka on 20.12.21.
//
//

import Foundation
import CoreData


extension FavoriteQuestions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteQuestions> {
        return NSFetchRequest<FavoriteQuestions>(entityName: "FavoriteQuestions")
    }

    @NSManaged public var question: String?

}

extension FavoriteQuestions : Identifiable {

}
