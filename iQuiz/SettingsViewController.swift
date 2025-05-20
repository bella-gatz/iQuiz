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
        
        let defaults = UserDefaults.standard
        let stored = defaults.string(forKey: "quizDataURL")
          ?? "https://tednewardsandbox.site44.com/questions.json"
        goodURL = stored
        urlTextField.text = stored
        quizzes = loadFromFile()
        // Do any additional setup after loading the view.
    }
    
    var quizzes: [Quiz] = []
    var goodURL: String?
    
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBAction func newHttp(_ sender : Any) {
        var urlString = urlTextField.text
        guard !urlString!.isEmpty else {
            callError()
            return
        }
        
        guard let requestURL = URL(string: urlString!) else {
            print("invalid url string")
            callError()
            return
        }
        
        var request = URLRequest(url: requestURL)
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
                        self.saveToFile(quiz: quizzes)
                        self.goodURL = urlString
                        UserDefaults.standard.set(urlString, forKey: "quizDataURL")
                    } catch {
                        print("Error in JSON decoding: \(error.localizedDescription)")
                        self.callError()
                    }
                    return
                }
              }
            }
        }).resume()
    }

    func callError() {
        let alert = UIAlertController(title: "Data Fetch Failed", message: "Invalid URL", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveToFile(quiz : [Quiz]) {
        let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("jsonData.json")
        
        do {
            let data = try JSONEncoder().encode(quiz)
            try data.write(to: file)
            print("Saved JSON data to url \(file)")
        } catch {
            print("Error saving JSON data: \(error)")
        }
    }
    
    func loadFromFile() -> [Quiz] {
        let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("jsonData.json")
//        let fileContents = try FileManager.default.contentsOfDirectory(atPath: "jsonData.json")
        
        do {
            let data = try Data(contentsOf: file)
            let contents = try JSONDecoder().decode([Quiz].self, from: data)
            print("Loaded data from \(file)")
            return contents
        } catch {
            print("Error loading JSON data: \(error)")
            return []
        }
    }
    
    
    @IBAction func openSettings(_ sender: Any) {
        UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tomain" {
            if let destinationVC = segue.destination as? ViewController {
                destinationVC.defaultURL = goodURL!
                destinationVC.quizzes = quizzes
            }
        }
    }
}
