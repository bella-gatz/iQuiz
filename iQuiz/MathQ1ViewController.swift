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
        
        question.text = quiz?[currPage].text
        totalPages = quiz!.count

        var index = 0
        for (answer) in quiz![currPage].answers {
            answerSegment.setTitle(answer, forSegmentAt: index)
            index += 1
        }
        // Do any additional setup after loading the view.
    }
    
    var quizTopic: String?
    var quiz: [QuizQuestion]?
    var currPage: Int = 0
    var totalPages: Int?
    var score: Int = 0
    
    @IBOutlet weak var answerSegment: UISegmentedControl!
    @IBOutlet weak var question: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "answer" {
            if let destinationVC = segue.destination as? MathA1ViewController {
                destinationVC.quiz = quiz
                destinationVC.currPage = currPage
                destinationVC.totalPage = totalPages
                destinationVC.selectedIndex = answerSegment.selectedSegmentIndex
                destinationVC.score = score
            }
        }
    }

}
