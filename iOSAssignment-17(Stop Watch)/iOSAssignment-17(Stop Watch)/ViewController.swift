//
//  ViewController.swift
//  iOSAssignment-17(Stop Watch)
//
//  Created by Utkarsh Patel on 19/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var timer: Timer? = nil
    var timeArray = [String]()
    var sec = 0
    var min = 0
    var hrs = 0
    
    @IBOutlet weak var timeDisplayLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        sender.shake()
        timeDisplayLabel.text = "00:00:00"
        timer?.invalidate()
        timeArray.removeAll()
        sec = 0
        min = 0
        hrs = 0
        timeArray = []
        tableView.reloadData()
        stopButton.isHidden = true
        startStopButton.isHidden = false
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        sender.pulsate()
        timer?.invalidate()
        timer = nil
        stopButton.isHidden = true
        startStopButton.isHidden = false
        sender.pulsate()
    }
    
    @IBAction func startStopTime(_ sender: UIButton) {
        sender.pulsate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.increment), userInfo: nil, repeats: true)
            startStopButton.isHidden = true
            stopButton.isHidden = false
            sender.pulsate()
    }
    
    @objc func increment() {
       
        if sec < 9 {
            sec += 1
            if min < 10{
                
                if hrs < 10{
                     timeDisplayLabel.text = "0\(hrs):0\(min):0\(sec)"
                }
                else{
                     timeDisplayLabel.text = "\(hrs):0\(min):0\(sec)"
                }
            }
        
            else{
                if hrs < 10{
                    timeDisplayLabel.text = "0\(hrs):\(min):0\(sec)"
                }
                else{
                    timeDisplayLabel.text = "\(hrs):\(min):0\(sec)"
                }
                
            }
            if sec == 59{
                sec = 0
                min += 1
                
            }
            if min == 59{
                sec += 1
                min = 0
                hrs += 1
            }
            if hrs == 12{
                sec += 1
                min += 1
                hrs  = 0
            }
            
        }
        else{
            sec += 1
            if min < 10{
                
                if hrs < 10{
                    timeDisplayLabel.text = "0\(hrs):0\(min):\(sec)"
                }
                else{
                    timeDisplayLabel.text = "\(hrs):0\(min):\(sec)"
                }
            }
                
            else{
                if hrs < 10{
                    timeDisplayLabel.text = "0\(hrs):\(min):\(sec)"
                }
                else{
                    timeDisplayLabel.text = "\(hrs):\(min):\(sec)"
                }
                
            }
            if sec == 59{
                sec = 0
                min += 1
                
            }
            if min == 59{
                sec += 1
                min = 0
                hrs += 1
            }
            if hrs == 12{
                sec += 1
                min += 1
                hrs  = 0
            }
        }
    }

    @IBAction func recordTime(_ sender: UIButton) {
        if(timeDisplayLabel.text != "00:00:00")
        {
            timeArray.insert(timeDisplayLabel.text!, at: 0)
            tableView.reloadData()
            print(timeDisplayLabel.text!)
            sender.flash()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell!.textLabel?.text = timeArray[indexPath.row]
        cell!.textLabel?.textColor = UIColor.cyan
        tableView.backgroundColor = UIColor.black
        cell?.backgroundColor = UIColor.black
        return cell!
    
}
}
