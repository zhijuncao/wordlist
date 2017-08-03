//
//  WritingViewController.swift
//  Word List
//
//  Created by 李俊 on 2017/8/3.
//  Copyright © 2017年 make school. All rights reserved.
//


import Foundation
import UIKit

class WritingViewController: UIViewController {
    var word: Words?
    
    
    @IBOutlet weak var wordTitleTextField: UITextField!
    
    @IBOutlet weak var translationTextField: UITextField!
    
    @IBOutlet weak var annotationTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        wordTitleTextField.text = word?.wordTitle ?? ""
        translationTextField.text = word?.translation ?? ""
        annotationTextView.text = word?.annotation ?? "annotation:"
    }
    //        // 1
    //        if let note = note {
    //            // 2
    //            noteTitleTextField.text = note.title
    //            noteContentTextView.text = note.content
    //        } else {
    //            // 3
    //            noteTitleTextField.text = ""
    //            noteContentTextView.text = ""
    //        }
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Save" {
            // if note exists, update title and content
            let word = self.word ?? CoreDataHelper.newWord()
            word.wordTitle = wordTitleTextField.text ?? ""
            word.translation = translationTextField.text ?? ""
            word.modificationTime = Date() as NSDate
            CoreDataHelper.saveWord()
        }
    }
}
