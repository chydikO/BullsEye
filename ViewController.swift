//
//  ViewController.swift
//  BullsEye
//
//  Created by maxxwell131 on 12/4/19.
//  Copyright © 2019 maxxwell131. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue :Int = 0
    var targetValue = 0
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetValues: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let roundenValue = slider.value.rounded()
        currentValue = Int(roundenValue)
        startNewRound()
    }

    @IBAction func showAlert() {
        var difference = 0
        if currentValue > targetValue {
            difference = currentValue - targetValue
        } else if currentValue < targetValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
        
        
        let massage = "The value of the slider is now : \(currentValue)" +
                                                    "\nThe target number is: \(targetValue)" +
                                                    "\nDifference: \(difference)"
        let alert = UIAlertController(title: "Hello Word!!", message: massage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundenValue = slider.value.rounded()
        currentValue = Int(roundenValue)
    }

    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLables()
    }
    
    func updateLables() {
        self.targetValues.text =  String(targetValue)
    }
}

