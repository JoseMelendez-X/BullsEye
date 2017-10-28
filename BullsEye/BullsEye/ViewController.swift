//
//  ViewController.swift
//  BullsEye
//
//  Created by Jose Melendez on 10/27/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentValue = lroundf(slider.value)
        startNewRound()

    }
    
    func updateLabels() {
        
        targetValueLabel.text = String(targetValue)
        
        scoreLabel.text = "\(score)"
        
        roundLabel.text = "\(round)"
    }

    func startNewRound() {
        
        //Generate random number from 1-100
        targetValue = 1 + Int(arc4random_uniform(100))
        
        currentValue = 50
        
        slider.value = Float(currentValue)
        
        round += 1
        
        updateLabels()
        
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        print("The value of the slider is now: \(slider.value)")
        
        currentValue = lroundf(slider.value)
    }


    @IBAction func showAlert() {
        
        let difference: Int = abs(currentValue - targetValue)
        
        var points = 100 - difference
        
        
        let title: String
        
        if difference == 0 {
            
            title = "Perfect! Like Jose, Extra 100 points!"
            points += 100
            
        } else if difference < 5  {
            
            title = "You almost had it"
            
            if difference == 1 {
                
                points += 50
            }
            
        } else if difference < 10 {
            
            title = "way off!"
    
        } else  {
            
            title = "WTF are you looking at. You need glasses"
        }
        
         score += points
        
        let message = "You scored \(points)"
        
       let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
}

