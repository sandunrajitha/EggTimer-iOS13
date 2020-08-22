//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var eggProgress: UIProgressView?
    
    
    let eggTimes = ["Soft":3, "Medium":4, "Hard":7]
    
    var remainingTime: Int = 0
    var selectedTime = 0
    var progressPercent: Float = 0
    
    var timer:Timer?
    var alarmSound: AVAudioPlayer?
    let audioPath = Bundle.main.path(forResource: "alarm_sound.mp3", ofType: nil)!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userSelection = sender.currentTitle!
        eggProgress?.progress = 0

        remainingTime = eggTimes[userSelection]!
        selectedTime = eggTimes[userSelection]!
        timeLabel.text = sender.currentTitle!
        eggTimer ()

    }
    
    func eggTimer () {
        timer?.invalidate()
        timer = nil
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerFires(){
        
        remainingTime -= 1
        progressPercent = (Float(selectedTime - remainingTime)/Float(selectedTime))
        print(progressPercent)
        
        eggProgress?.setProgress(progressPercent, animated: true)
        
        if remainingTime <= 0 {
            timer?.invalidate()
            timer = nil
            timeLabel.text = "DONE !"
            
            let audioURL = URL(fileURLWithPath: audioPath)
            do {
                alarmSound = try AVAudioPlayer(contentsOf: audioURL)
                alarmSound?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }
    
    
}
