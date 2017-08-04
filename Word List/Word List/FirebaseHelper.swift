//
//  FirebaseHelper.swift
//  Word List
//
//  Created by 李俊 on 03/08/2017.
//  Copyright © 2017 make school. All rights reserved.
//


import FirebaseDatabase
import UIKit

class FirebaseHelper {
    
    ///////// WRITE FUNCTIONS
    
    static func createReadingWords(
                             annotation: String,
                            translation: String,
                            wordTitle: String,
                            wordModificationTime: String) {
        
        let dictionary = ["annotation" : annotation,
                          "translation" : translation,
            "wordModificationTime" : wordModificationTime,
                          "wordTitle" : wordTitle] as [String : Any]
        
        let ref = Database.database().reference().child("reading").child(wordTitle)
        ref.updateChildValues(dictionary)
    }
    
    static func createWritingWords(
                      annotation: String,
                      translation: String,
                      wordTitle: String,
                      wordModificationTime: String) {
        
        let dictionary = ["annotation" : annotation,
                          "translation" : translation,
                          "wordModificationTime" : wordModificationTime,
                          "wordTitle" : wordTitle] as [String : Any]
        
        let ref = Database.database().reference().child("writing").child(wordTitle)
        ref.updateChildValues(dictionary)
    }


///////// READ FUNCTIONS

    static func getReadingWord(wordTitle: String,
                     completion: @escaping (ReadingWord) -> ()) {
    
        let ref = Database.database().reference().child("reading").child(wordTitle)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let word = ReadingWord(dictionary: snapshot.value as!   [String : Any], key: snapshot.key)
            completion(word)
        })
    }
    static func getReadingWords(completion: @escaping ([ReadingWord]) -> ()) {
        
        let ref = Database.database().reference().child("reading")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            var array = [ReadingWord]()
            if let dictionary = snapshot.value as? [String : Any] {
                for key in dictionary.keys {
                    let word = ReadingWord(dictionary: dictionary[key] as! [String : Any], key: key)
                    array.append(word)
                }
            }
            completion(array)
        })
    }


    static func getWritingWords(completion: @escaping ([WritingWord]) -> ()) {
        
        let ref = Database.database().reference().child("writing")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            var array = [WritingWord]()
            if let dictionary = snapshot.value as? [String : Any] {
                for key in dictionary.keys {
                    let word = WritingWord(dictionary: dictionary[key] as! [String : Any], key: key)
                    array.append(word)
                }
            }
            completion(array)
        })
    }
}





    
