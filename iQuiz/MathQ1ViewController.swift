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

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var answerSegment: UISegmentedControl!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "q1toa1" {
            if let destinationVC = segue.destination as? MathA1ViewController {
                destinationVC.correctIndex = 2
                destinationVC.selectedIndex = answerSegment.selectedSegmentIndex
            }
        }
    }

}
