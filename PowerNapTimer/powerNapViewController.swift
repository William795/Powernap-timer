//
//  ViewController.swift
//  PowerNapTimer
//
//  Created by William Moody on 5/7/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class powerNapViewController: UIViewController {

    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timeStartButton: UIButton!
    
    let myTimer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate func updateTimerLable() {
        timerLabel.text = myTimer.timeAsString
    }
    
    func updateView() {
        updateTimerLable()
        if myTimer.isOn{
            timeStartButton.setTitle("Cancle", for: .normal)
        }else {
            timeStartButton.setTitle("Power Nap", for: .normal)
        }
    }

    @IBAction func timeStartButtonTapped(_ sender: Any) {
        if myTimer.isOn {
            myTimer.timerStop()
        }else {
            myTimer.timerStart(time: 5)
        }
        updateView()
    }
    
}
//4) Adopt the protocol
extension powerNapViewController: MyTimerDelegate {
    
    //5)implement delegate funtions
    func timerSecondTicked() {
        updateTimerLable()
        timerLabel.text =
    }
    
    func timerCompleted() {
        updateView()
        //to do: present alert controller
    }
    
    func timerStopped() {
        updateView()
    }
    
    
}
