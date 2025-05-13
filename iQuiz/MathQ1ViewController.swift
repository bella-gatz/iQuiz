//
//  MathQ1ViewController.swift
//  iQuiz
//
//  Created by Bella Gatzemeier on 5/12/25.
//

import UIKit

class MathQ1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        correct.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonName: UIButton!
    @IBOutlet weak var seg: UISegmentedControl!
    @IBOutlet weak var correct: UILabel!

    var A1Index = -1
    var A2Index = -1
    var A1Answer = 2
    var A2Answer = 0
    var score = 0
    
    
    @IBAction func answer(_ sender: UISegmentedControl) {

        let tapped = sender.selectedSegmentIndex
        if label.text == "What is the integral of 1?" {
            A1Index = tapped
            print(A1Index)
        } else if label.text == "What is the derivative of 1?" {
            A2Index = tapped
            print(A2Index)
        }
    }
    
    func correction(tapped : Int, correctIndex: Int) {
            if tapped == correctIndex {
                correct.text = "✅"
                score += 1
            } else {
                correct.text = "❌"
            }
        correct.isHidden = false
    }
    
    func finished() {
        if score == 2 {
            correct.text = "Perfect!"
        } else if score == 1 {
            correct.text = "Almost there!"
        } else {
            correct.text = "Better luck next time"
        }
    }
    
    
    @IBAction func Next(_ sender: Any) {
        if (label.text == "What is the integral of 1?") {
            correction(tapped: A1Index, correctIndex: A1Answer)
            seg.isHidden = true
            label.text = "Answer for Q1: " // TODO: need to show question
            buttonName.setTitle("Next", for: UIControl.State.normal)
            
        } else if label.text == "Answer for Q1: " {
            correct.isHidden = true
            label.textColor = .black
            seg.isHidden = false
            label.text = "What is the derivative of 1?"
            buttonName.setTitle("Submit", for: UIControl.State.normal)

        } else if label.text == "What is the derivative of 1?" {
            correction(tapped: A2Index, correctIndex: A2Answer)
            seg.isHidden = true
            label.text = "Answer for Q2: "
            buttonName.setTitle("Next", for: UIControl.State.normal)

        } else if label.text == "Answer for Q2: "{
            label.textColor = .black
            seg.isHidden = true
            label.text = "Score:" + " " + String(score)
            finished()
            
            
            buttonName.setTitle("Next", for:  UIControl.State.normal) // TODO: need this button to go to home screen

        } else {
            seg.isHidden = false
            label.text = "What is the integral of 1?"
            buttonName.setTitle("Submit", for: UIControl.State.normal)
        }
    }

}
