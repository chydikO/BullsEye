//
//  ViewController.swift
//  BullsEye
//
//  Created by maxxwell131 on 12/4/19.
//  Copyright © 2019 maxxwell131. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello Word!!", message: "This is my first App !", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func knockCnock() {
        let alert = UIAlertController(title: "Knock, knock .....", message: "Who`s There", preferredStyle: .alert)
        let action = UIAlertAction(title: "Litle old lady", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

