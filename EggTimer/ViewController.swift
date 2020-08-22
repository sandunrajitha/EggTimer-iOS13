//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    let soft = 5
    let medium = 7
    let hard = 12
    
    var remainingTime: Int = 0
    var timer:Timer?
    
    let eggTimes = ["Soft":3, "Medium":4, "Hard":7]
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userSelection = sender.currentTitle
        
        switch userSelection {
        case "Soft":
            print(eggTimes["Soft"]!)
            remainingTime = eggTimes["Soft"]!
            eggTimer ()
            
        case "Medium":
            print(eggTimes["Medium"]!)
            remainingTime = eggTimes["Medium"]!
            eggTimer ()
            
        case "Hard":
            print(eggTimes["Hard"]!)
            remainingTime = eggTimes["Hard"]!
            eggTimer ()
            
        default:
            print("error")
        }
    }
    
    func eggTimer () {
        timer?.invalidate()
        timer = nil
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerFires(){
        remainingTime -= 1
        print(remainingTime)
        
        if remainingTime <= 0 {
            timer?.invalidate()
            timer = nil
            timeLabel.text = "DONE !"
        }
    }
    
    
}
