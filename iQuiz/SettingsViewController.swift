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
        url.text = "http://tednewardsandbox.site44.com/questions.json"
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var url: UITextField!
    
    @IBAction func newHttp(_ sender: Any) {
        // TODO: http call
        // TODO: send json data to quiz!
        // TODO: notification if error in call
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
