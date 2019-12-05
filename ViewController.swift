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
    @IBOutlet weak var slider : UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let roundenValue = slider.value.rounded()
        currentValue = Int(roundenValue)
    }

    @IBAction func showAlert() {
        let massage = "The value of the slider is now : \(currentValue)"
        let alert = UIAlertController(title: "Hello Word!!", message: massage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundenValue = slider.value.rounded()
        currentValue = Int(roundenValue)
    }

}

