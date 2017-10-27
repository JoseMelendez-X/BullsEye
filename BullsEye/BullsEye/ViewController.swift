//
//  ViewController.swift
//  BullsEye
//
//  Created by Jose Melendez on 10/27/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentValue = lroundf(slider.value)
        startNewRound()
        
    }
    
    func updateLabels() {
        
        targetValueLabel.text = String(targetValue)
    }

    func startNewRound() {
        
        //Generate random number from 1-100
        targetValue = 1 + Int(arc4random_uniform(100))
        
        currentValue = 50
        
        slider.value = Float(currentValue)
        
        updateLabels()
        
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        print("The value of the slider is now: \(slider.value)")
        
        currentValue = lroundf(slider.value)
    }


    @IBAction func showAlert() {
        
        var difference: Int
        
        if currentValue > targetValue {
            
            difference = currentValue - targetValue
            
        } else if currentValue < targetValue {
            
            difference = targetValue - currentValue
            
        } else {
            
            difference = 0
        }
        
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is \(targetValue)" + "\nThe difference is \(difference)"
        
       let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
}

