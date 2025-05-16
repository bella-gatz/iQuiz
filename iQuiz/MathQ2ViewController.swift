//
//  MathQ2ViewController.swift
//  iQuiz
//
//  Created by Bella Gatzemeier on 5/13/25.
//

import UIKit

class MathQ2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        question.text = quiz?[1].text
        
        var index = 0
        for (answer) in quiz![1].answers {
            answerSegment.setTitle(answer, forSegmentAt: index)
            index += 1
        }
    }
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answerSegment: UISegmentedControl!
    
    var score: Int?
    var quiz: [QuizQuestion]?

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "q2toa2" {
            if let destinationVC = segue.destination as? MathA2ViewController {
                destinationVC.selectedIndex = answerSegment.selectedSegmentIndex
                print(answerSegment.selectedSegmentIndex)
                destinationVC.score = score!
                destinationVC.quiz = quiz
            }
        } 
    }
}
