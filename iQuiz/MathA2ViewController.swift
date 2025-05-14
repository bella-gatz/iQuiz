//
//  MathA2ViewController.swift
//  iQuiz
//
//  Created by Bella Gatzemeier on 5/13/25.
//

import UIKit

class MathA2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        question.text = quiz?[1].question
        answer.text = quiz?[1].answers[(quiz?[1].correctIndex)!]
        
        
        if quiz?[1].correctIndex == selectedIndex {
            correction.text = "Correct!"
            score! += 1
            print("Correct!")
        } else {
            correction.text = "Incorrect!"
            print("Incorrect!")
        }
    }
    
    @IBOutlet weak var correction: UILabel!
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    
    var selectedIndex: Int?
    var score: Int?
    var quiz: [QuizQuestion]?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "a2toanswers" {
            if let destinationVC = segue.destination as? MathAnswersViewController {
                destinationVC.score = score!
            }
        }
    }
}
