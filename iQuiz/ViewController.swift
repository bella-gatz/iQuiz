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

struct QuizQuestion {
    let question: String
    let answers: [String]
    let correctIndex: Int
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var cellName = ["Mathematics", "Marvel Super Heroes", "Science"]
    var cellText = ["Remember algebra?", "Spiderman fan?", "Not zodiac based!"]
    var cellImage = ["mathIcon", "marvelIcon", "scienceIcon"]
    var selectedQuiz: String = ""
    
    
    var mathQuiz: [QuizQuestion] = [
        QuizQuestion(question: "What is the integral of x?", answers: ["0", "x", "x + C", "x^2 + C"], correctIndex: 2),
        QuizQuestion(question: "What is the derivative of 1?", answers: ["0", "x", "x + C", "x^2 + C"], correctIndex: 0)]
    
    var marvelQuiz: [QuizQuestion] = [
        QuizQuestion(question: "What hero uses spiderwebs?", answers: ["Superman", "Spiderman", "Ironman", "The Hulk"], correctIndex: 1),
        QuizQuestion(question: "How many inifity stones are there?", answers: ["7", "8", "6", "5"], correctIndex: 1)
    ]

    var scienceQuiz: [QuizQuestion] = [
        QuizQuestion(question: "What is the atomic number for copper?", answers: ["47", "21", "28", "29"], correctIndex: 3),
        QuizQuestion(question: "How many elements in the atomic table?", answers: ["120", "118", "100", "133"], correctIndex: 2)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
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
    

    
    @IBAction func settingstapped(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Settings go here", message: "", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
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
                } else if selectedQuiz == "Marvel Super Heroes" {
                    destinationVC.quiz = marvelQuiz

                } else {
                    destinationVC.quiz = scienceQuiz

                }
            }
        }
        
    }
    
}
