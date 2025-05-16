//
//  ViewController.swift
//  iQuiz
//
//  Created by Bella Gatzemeier on 4/28/25.
//

import UIKit

class tableCell: UITableViewCell {
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellText: UILabel!
}



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        if quizzes.count > 0 {
            for quiz in quizzes {
                cellName.append(quiz.title)
                cellText.append(quiz.desc)
                for question in quiz.questions {
                    if quiz.title == "Mathematics" {
                        mathQuiz.append(question)
                    } else if quiz.title == "Marvel Super Heroes" {
                        marvelQuiz.append(question)
                    } else if quiz.title == "Science!" {
                        scienceQuiz.append(question)
                    }
                }
            }
        } else {
            cellName = ["Mathematics", "Marvel Super Heroes", "Science"]
            cellText = ["Remember algebra?", "Spiderman fan?", "Not zodiac based!"]
//            mathQuiz = [
//                QuizQuestion(text: "What is the integral of x?", answer: "3", answers: ["0", "x", "x + C", "x^2 + C"]),
//                QuizQuestion(text: "What is the derivative of 1?" , answer: "1", answers: ["0", "x", "x + C", "x^2 + C"])
//            ]
//            marvelQuiz = [
//                QuizQuestion(text: "What hero uses spiderwebs?", answer: "2", answers: ["Superman", "Spiderman", "Ironman", "The Hulk"]),
//                QuizQuestion(text: "How many inifity stones are there?", answer: "3", answers: ["7", "8", "6", "5"])
//            ]
//        
//            scienceQuiz = [
//                QuizQuestion(text: "What is the atomic number for copper?", answer: "4", answers: ["47", "21", "28", "29"]),
//                QuizQuestion(text: "How many elements in the atomic table?", answer: "3" , answers: ["120", "118", "100", "133"])
//            ]
            
        }
        
        // TODO: questions to quiz
    }
    
    @IBOutlet weak var tableView: UITableView!
    var cellName: [String] = []
    var cellText: [String] = []
    var cellImage = ["mathIcon", "marvelIcon", "scienceIcon"]
    var selectedQuiz: String = ""
    var quizzes: [Quiz] = []
    var mathQuiz: [QuizQuestion] = []
    var marvelQuiz: [QuizQuestion] = []
    var scienceQuiz: [QuizQuestion] = []

    // sets up table size rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellName.count
    }
    
    // sets up data in each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableCell
        cell.cellName.text = cellName[indexPath.row]
        cell.cellText.text = cellText[indexPath.row]
        cell.cellImage.image = UIImage(named: cellImage[indexPath.row])
        return cell
    }
    
    
    // height of row at every index
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func settingsTapped(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedQuiz = cellName[indexPath.row]
        print(selectedQuiz)
        performSegue(withIdentifier: "quiz", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quiz" {
            if let destinationVC = segue.destination as? MathQ1ViewController {
                destinationVC.quizTopic = selectedQuiz
                if selectedQuiz == "Mathematics" {
                    destinationVC.quiz = mathQuiz
                    destinationVC.totalPages = mathQuiz.count
                } else if selectedQuiz == "Marvel Super Heroes" {
                    destinationVC.quiz = marvelQuiz
                    destinationVC.totalPages = marvelQuiz.count
                } else {
                    destinationVC.quiz = scienceQuiz
                    destinationVC.totalPages = scienceQuiz.count
                }
            }
        } 
        
    }
    
}
