//
//  WordListViewController.swift
//  Word List
//
//  Created by 李俊 on 2017/8/3.
//  Copyright © 2017年 make school. All rights reserved.
//

import Foundation
import UIKit
class WordListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayReading" {
                print("displayReading tapped")
                
//                // 1
//                let indexPath = tableView.indexPathForSelectedRow!
//                // 2
//                let word = words[indexPath.row]
//                // 3
//                let readingViewController = segue.destination as! ReadingViewController
//                // 4
//                readingViewController.word = word
//                
            } else if identifier == "displayWriting" {
                print("displayWriting tapped")
            }
        }
    }

    
    
    

}
