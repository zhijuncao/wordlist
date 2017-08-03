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
    
    @IBOutlet weak var noteContentTextView: UITextView!
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteTitleTextField.text = note?.title ?? ""
        noteContentTextView.text = note?.content ?? "content:"
        
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
        if segue.identifier == "save" {
            // if note exists, update title and content
            let note = self.note ?? CoreDataHelper.newNote()
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            note.modificationTime = Date() as NSDate
            CoreDataHelper.saveWord()
        }
}
