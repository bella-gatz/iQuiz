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
        loadQuizzes(url: defaultURL)
        
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
    var defaultURL: String = "https://tednewardsandbox.site44.com/questions.json"

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedQuiz = cellName[indexPath.row]
        print(selectedQuiz)
        performSegue(withIdentifier: "quiz", sender: self)
    }
    
    func loadQuizzes(url: String) {
        guard !url.isEmpty else {
            callError()
            return
        }
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        (URLSession.shared.dataTask(with: request) { data, response, error
            in DispatchQueue.main.async {
                if error != nil {
                    print("HTTP Request Error: \(error!.localizedDescription)")
                    self.callError()
                } else {
                    guard let httpresponse = response as? HTTPURLResponse else {
                        self.callError()
                        return
                    }
                  
                    print(httpresponse.statusCode)
                  
                    if data == nil {
                        self.callError()
                        return
                    } else {
                        do {
                            let quizzes = try JSONDecoder().decode([Quiz].self, from: data!)
                            self.quizzes = quizzes
                            
                            
                            self.cellName = []
                            self.cellText = []
                            self.mathQuiz = []
                            self.marvelQuiz = []
                            self.scienceQuiz = []
                            
                            if quizzes.count > 0 {
                                for quiz in quizzes {
                                    self.cellName.append(quiz.title)
                                    self.cellText.append(quiz.desc)
                                    for question in quiz.questions {
                                        if quiz.title == "Mathematics" {
                                            self.mathQuiz.append(question)
                                        } else if quiz.title == "Marvel Super Heroes" {
                                            self.marvelQuiz.append(question)
                                        } else if quiz.title == "Science!" {
                                            self.scienceQuiz.append(question)
                                        }
                                    }
                                }
                                self.tableView.reloadData()
                            } else {
                                self.cellName = ["Network Error"]
                                self.cellText = [""]
                                self.callError()
                            }
                        } catch {
                            print("Error in JSON decoding: \(error.localizedDescription)")
                            self.callError()
                        }
                  }
                }
              }
            }).resume()
    }
    
    func callError() {
        let alert = UIAlertController(title: "Network Error", message: "Invalid URL", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        loadQuizzes(url: defaultURL)
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
