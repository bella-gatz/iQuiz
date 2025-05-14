//
//  MathAnswersViewController.swift
//  iQuiz
//
//  Created by Bella Gatzemeier on 5/13/25.
//

import UIKit

class MathAnswersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if score == 2 {
            message.text = "Perfect!"
        } else if score == 1 {
            message.text = "Almost there!"
        } else {
            message.text = "Better luck next time!"
        }
        scoreDisplay.text = String(score!) + " / 2"
        // Do any additional setup after loading the view.
    }
    
    var score: Int?
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var scoreDisplay: UILabel!
    
}
