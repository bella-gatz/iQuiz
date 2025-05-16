//
//  MathA1ViewController.swift
//  iQuiz
//
//  Created by Bella Gatzemeier on 5/13/25.
//

import UIKit

class MathA1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        question.text = quiz?[0].text
        
        let index = Int((quiz?[0].answer)!)! - 1
        answer.text = quiz?[0].answers[index]
        
        if index == selectedIndex {
            correction.text = "Correct!"
            print("Correct!")
            score += 1
            
        } else {
            correction.text = "Incorrect!"
            print("Incorrect!")
        }
        print(score)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var correction: UILabel!
    
    var selectedIndex: Int?
    var score = 0
    var quiz: [QuizQuestion]?
    @IBOutlet weak var question: UILabel!

    @IBOutlet weak var answer: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "a1toq2" {
            if let destinationVC = segue.destination as? MathQ2ViewController {
                destinationVC.score = score
                destinationVC.quiz =  quiz
            }
        }
    }
    
}
