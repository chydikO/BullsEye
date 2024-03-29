//
//  ViewController.swift
//  BullsEye
//
//  Created by maxxwell131 on 12/4/19.
//  Copyright © 2019 maxxwell131. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetValues: UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let roundenValue = slider.value.rounded()
        currentValue = Int(roundenValue)
        startNewGame()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighLighted = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageHighLighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeableImage = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeableImage, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizeableImage = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizeableImage, for: .normal)
        
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var  points = 100 - difference
        score += points
        
        let title : String
        if difference == 0 {
            title = "Perfect !"
            points += 100
        } else if difference < 5 {
            title = "You almost had it"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good"
        } else {
            title = "Not even close"
        }
        
        let massage = "You scored: \(points) points"
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        //startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundenValue = slider.value.rounded()
        currentValue = Int(roundenValue)
    }
    
    @IBAction func startOver() {
        startNewGame()
    }

    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLables()
    }
    
    func updateLables() {
        targetValues.text =  String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

