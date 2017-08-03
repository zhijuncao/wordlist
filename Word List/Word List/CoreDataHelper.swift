//
//  CoreDataHelper.swift
//  Word List
//
//  Created by 李俊 on 2017/8/3.
//  Copyright © 2017年 make school. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    //static methods will go here
    static func newWord() -> Words {
        let word = NSEntityDescription.insertNewObject(forEntityName: "Words", into: managedContext) as! Words
        return word
    }
    static func newReadingWord() -> ReadingWords {
        let word = NSEntityDescription.insertNewObject(forEntityName: "ReadingWords", into: managedContext) as! ReadingWords
        return word
    }

    static func saveWord(){
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    static func deleteWord(word: Words){
        managedContext.delete(word)
        saveWord()
    }
    static func deleteReadingWord(word: ReadingWords){
        managedContext.delete(word)
        saveWord()
    }
    static func retrieveWord() -> [Words] {
        let fetchRequest = NSFetchRequest<Words>(entityName: "Words")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }
    static func retrieveReadingWord() -> [ReadingWords] {
        let fetchRequest = NSFetchRequest<ReadingWords>(entityName: "ReadingWords")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }

}

