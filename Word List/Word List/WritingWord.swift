//
//  WritingWord.swift
//  Word List
//
//  Created by 李俊 on 04/08/2017.
//  Copyright © 2017 make school. All rights reserved.
//

import Foundation
class WritingWord {
    
    let wordTitle : String
    let annotation: String
    let translation: String
    let wordModificationTime: String
    //    "annotation" : annotation,
    //    "translation" : translation,
    //    "wordModificationTime" : wordModificationTime,
    //    "wordTitle" : wordTitle
    
    init(dictionary: [String: Any], key: String) {
        wordTitle = key
        annotation = dictionary["annotation"] as! String
        translation = dictionary["translation"] as! String
        wordModificationTime = dictionary["wordModificationTime"] as! String
    }
}
    
