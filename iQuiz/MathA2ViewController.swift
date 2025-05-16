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
        
        question.text = quiz?[0].text
        
        let index = Int((quiz?[0].answer)!)! - 1
        answer.text = quiz?[0].answers[index]
        
        if index == selectedIndex {
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
