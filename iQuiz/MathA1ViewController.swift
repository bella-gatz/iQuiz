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
        
        if correctIndex == selectedIndex {
            correction.text = "Correct!"
            print("Correct!")
        } else {
            correction.text = "Incorrect!"
            print("Incorrect!")
        }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var correction: UILabel!
    
    var correctIndex: Int?
    var selectedIndex: Int?
    

    
}
