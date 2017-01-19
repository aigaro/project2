//
//  ViewController.swift
//  project2
//
//  Created by Aigar on 19/01/17.
//  Copyright © 2017 Aigar. All rights reserved.
//
import GameplayKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        for button in view.subviews where button is UIButton {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
    
    askQuestion(action: nil)
        
    }
    
    func askQuestion(action: UIAlertAction!) {
        
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        
        title = countries[correctAnswer].uppercased()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
     let ac = UIAlertController(title: title, message: "Your Score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

