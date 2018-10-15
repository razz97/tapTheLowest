//
//  ViewController.swift
//  tapTheLowest
//
//  Created by Alex on 15/10/2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nums:[Int] = []
    var timer:Timer!
    var seconds:Int = 30
    var score:Int = 0
    
    
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTime.text = "\(seconds)"
        initBtns()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rvc = segue.destination as! ResultsViewController
        rvc.score = score
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if nums.first == sender.tag {
            sender.isHidden = true
            nums.removeFirst()
            score += 5
            lblScore.text = "\(score)"
            if nums.isEmpty {
                seconds += 3
                lblTime.text = "\(seconds)"
                initBtns()
            }
        } else {
            seconds -= 1
            if seconds <= 0 {
                timer.invalidate()
                performSegue(withIdentifier: "endGame", sender: self)
            }
            lblTime.text = "\(seconds)"
        }
    }
    
    func initBtns() {
        for btn in buttons {
            let rand = Int.random(in: -100...100)
            btn.setTitle("\(rand)", for: .normal)
            btn.tag = rand
            btn.isHidden = false
            nums.append(rand)
        }
        nums.sort()
    }
    
    @objc func countDown() {
        seconds -= 1
        lblTime.text = "\(seconds)"
        if seconds <= 0 {
            timer.invalidate()
            performSegue(withIdentifier: "endGame", sender: self)
        }
    }
    
}



