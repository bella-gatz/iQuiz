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
        
        question.text = quiz?[0].text
        totalPages = quiz!.count
        print(totalPages)
        print(quiz)
//        var index = 0
//        for (answer) in quiz![0].answers {
//            answerSegment.setTitle(answer, forSegmentAt: index)
//            index += 1
//        }
        // Do any additional setup after loading the view.
    }
    
    var quizTopic: String?
    var quiz: [QuizQuestion]?
    var currPage = 0
    var totalPages: Int = 0
    
    @IBOutlet weak var answerSegment: UISegmentedControl!
    @IBOutlet weak var question: UILabel!
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "q1toa1" {
            if let destinationVC = segue.destination as? MathA1ViewController {
                destinationVC.selectedIndex = answerSegment.selectedSegmentIndex
                destinationVC.quiz = quiz
            }
        }
    }

}
