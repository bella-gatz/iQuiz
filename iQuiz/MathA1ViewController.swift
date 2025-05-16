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
        
        question.text = quiz?[currPage!].text
        print(currPage!)
        let index = Int((quiz?[currPage!].answer)!)! - 1
        answer.text = quiz?[currPage!].answers[index]
        
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
    var currPage: Int?
    var totalPage: Int?
    
    @IBOutlet weak var question: UILabel!

    @IBOutlet weak var answer: UILabel!
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        if currPage! + 1 >= totalPage! {
            performSegue(withIdentifier: "finalPage", sender: self)
        } else {
            performSegue(withIdentifier: "question", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finalPage" {
            if let destinationVC = segue.destination as? MathAnswersViewController {
                destinationVC.score = score
                destinationVC.totalPage =  totalPage
            }
        } else if segue.identifier == "question" {
            if let destinationVC = segue.destination as? MathQ1ViewController {
                destinationVC.score = self.score
                destinationVC.quiz = self.quiz
                destinationVC.currPage = self.currPage! + 1
                destinationVC.totalPages = self.totalPage
            }
        }
    }
    
}
