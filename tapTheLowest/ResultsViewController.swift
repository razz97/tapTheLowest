//
//  ResultsViewController.swift
//  tapTheLowest
//
//  Created by Alex on 15/10/2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    let storage = UserDefaults.standard
    var topThreeScores:[Int]!
    var score:Int = 0
    
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet var lblsTopThree: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topThreeScores = storage.array(forKey: "topThree") as? [Int] ?? [0,0,0]
        lblScore.text = score > topThreeScores[2] ? "New top 3!!\nScore: \(score)" : "Score: \(score)"
        topThreeScores.append(score)
        topThreeScores.sort(by: >)
        topThreeScores.removeLast()
        for i in 0...2 {
            lblsTopThree[i].text?.append("\(topThreeScores[i]) points")
        }
        storage.set(topThreeScores,forKey:"topThree")
    }
}
