//
//  ViewController.swift
//  10Timer
//
//  Created by ElenaL on 04.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    var timer: Timer?

    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var switchTimer: UISwitch!
    
    @objc func switchTimerPress() {
       if switchTimer.isOn {
            counter += 1
       } else {
           counter -= 1
       }
        updateCounter()
    }
    
    @IBAction func startBtn(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.switchTimerPress), userInfo: nil, repeats: true)
        switchTimer.isEnabled = false
    }
    
    
    @IBAction func stopBtn(_ sender: Any) {
        timer?.invalidate()
        updateCounter()
        switchTimer.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounter()
    }
    
    func updateCounter() {
        countLabel.text = "Count: \(counter)"
    }


}

