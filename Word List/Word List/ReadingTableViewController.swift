//
//  ReadingTableViewController.swift
//  Word List
//
//  Created by 李俊 on 2017/8/3.
//  Copyright © 2017年 make school. All rights reserved.
//
import Foundation
import UIKit

class ReadingTableViewController: UITableViewController {
    // 1
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //1
            CoreDataHelper.deleteReadingWord(word: words[indexPath.row])
            //2
            words = CoreDataHelper.retrieveReadingWord()
        }
    }
    
    var words = [ReadingWords]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        FirebaseHelper.getReadingWords(wordTitle: words, completion: nil)
        words = CoreDataHelper.retrieveReadingWord()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        words = CoreDataHelper.retrieveReadingWord()
        
        print("hi- im the words branch")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "readingTableViewCell", for: indexPath) as! ReadingTableViewCell
        
        // 1
        let row = indexPath.row
        
        // 2
        let word = words[row]
        
        // 3
        cell.wordrLabel.text = word.wordTitle
        
        
        // 4
        cell.wordrModificationTimeLabel.text = word.modificationTime?.convertToString()
        
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
                let ReadingViewController = segue.destination as! ReadingViewController
                // 4
                ReadingViewController.word = word
                
            } else if identifier == "addWord" {
                print("+ button tapped")
            }
        }
    }
    
    @IBAction func unwindToReadingViewController(_ segue: UIStoryboardSegue) {
        self.words = CoreDataHelper.retrieveReadingWord()
    }
    
}

