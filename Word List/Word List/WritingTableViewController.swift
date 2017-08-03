//
//  WritingTableViewController.swift
//  Word List
//
//  Created by 李俊 on 2017/8/3.
//  Copyright © 2017年 make school. All rights reserved.
//

import Foundation
import UIKit

class WritingTableViewController: UITableViewController {
    // 1
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //1
            CoreDataHelper.deleteWord(word: words[indexPath.row])
            //2
            words = CoreDataHelper.retrieveWord()
        }
    }
    
    var words = [Words]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
//    var showWords = [Words]() {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        words = CoreDataHelper.retrieveWord()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        words = CoreDataHelper.retrieveWord()
        
        print("hi- im the words branch")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "writingTableViewCell", for: indexPath) as! WritingTableViewCell
        
        // 1
        let row = indexPath.row
        
        // 2
        let word = words[row]
        
        // 3
        cell.wordwLabel.text = word.wordTitle
    
        
        // 4
        cell.wordwModificationTimeLabel.text = word.modificationTime?.convertToString()
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayWord" {
                print("Table view cell tapped")
                
                // 1
                let indexPath = tableView.indexPathForSelectedRow!
                // 2
                let word = words[indexPath.row]
                // 3
                let WritingViewController = segue.destination as! WritingViewController
                // 4
                WritingViewController.word = word
                
            } else if identifier == "addWord" {
                print("+ button tapped")
            }
        }
    }
    
    @IBAction func unwindToWritingViewController(_ segue: UIStoryboardSegue) {
        self.words = CoreDataHelper.retrieveWord()
    }
    
}

