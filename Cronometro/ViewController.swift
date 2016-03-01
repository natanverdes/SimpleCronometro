//
//  ViewController.swift
//  Cronometro
//
//  Created by Natan on 3/1/16.
//  Copyright © 2016 Natan Verdes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var startButton: UIBarButtonItem!
    @IBOutlet weak var clearButton: UIBarButtonItem!
    
    var timer = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func startButtonClick(sender: AnyObject) {
        if(startButton.title == "Start"){
            startButton.title = "Stop"
            clearButton.enabled = false
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        }else if(startButton.title == "Stop"){
            startButton.title = "Start"
            clearButton.enabled = true
            timer.invalidate()
        }
    }

    @IBAction func clearButtonClick(sender: AnyObject) {
        if(clearButton.enabled){
            counterLabel.text = "0"
        }
    }
    
    func updateCounter(){
        counterLabel.text = String(Int(counterLabel.text!)! + 1)
    }
}

