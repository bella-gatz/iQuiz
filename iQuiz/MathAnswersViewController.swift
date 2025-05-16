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
        if score! >= 1 {
            message.text = "Nice work!"
        } else {
            message.text = "Better luck next time!"
        }
        scoreDisplay.text = String(score!) + " / " + String(totalPage!)
        // Do any additional setup after loading the view.
    }
    
    var score: Int?
    var totalPage: Int?
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var scoreDisplay: UILabel!
    
}
