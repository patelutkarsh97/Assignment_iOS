//
//  ViewController.swift
//  BullsEye
//
//  Created by Utkarsh Patel on 09/06/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = Int()
    var targetValue = Int()
    var score = 0
    var round = 0
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var hitMeButton: UIButton!
    @IBOutlet weak var startOverButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
        updateLabel()
    }

    
    @IBAction func onClickStartOverButton(_ sender: Any) {
        exit(0)
    }
    
    @IBAction func onClickInfoButton(_ sender: Any) {
        let alert = UIAlertController.init(title: "Developed By UTKARSH", message: "Thanks for playing this game", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("value of slider is now: \(slider.value)")
        
    }
    
    @IBAction func onClickHitMe(_ sender: Any) {
        
    let difference = abs(currentValue - targetValue)
    var points = 100 - difference
        
  
    var title: String
    if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
            points = 100 - difference - 50
        } else {
            title = "Not even close..."
            points = 0
        }
        
        score += points
        
    let message = "You scored \(points) points"
    let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
    
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(UInt32(100.4)))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
    }
        
    func updateLabel() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
}

