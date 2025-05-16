//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Bella Gatzemeier on 5/14/25.
//

import UIKit


class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        goodURL = "https://tednewardsandbox.site44.com/questions.json"
        url.text = goodURL
        // Do any additional setup after loading the view.
    }
    
    var reqQuizzes: [Quiz] = []
    var reqQs: [QuizQuestion] = []
    var goodURL: String?
    
    @IBOutlet weak var url: UITextField!
    
    @IBAction func newHttp(_ sender: Any) {
        var url = url.text
        guard !url!.isEmpty else {
            callError()
            return
        }
        
        var request = URLRequest(url: URL(string: url!)!)
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
                        
                    } catch {
                        print("Error in JSON decoding: \(error.localizedDescription)")
                        self.callError()
                        return
                    }
                    self.goodURL = url
                }
                
              }
            }
        }).resume()
    }

    func callError() {
        let alert = UIAlertController(title: "Network Error", message: "Invalid URL", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tomain" {
            if let destinationVC = segue.destination as? ViewController {
                destinationVC.defaultURL = goodURL!
            }
        }
    }
}
