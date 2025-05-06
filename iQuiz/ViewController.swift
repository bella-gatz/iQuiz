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
        @IBOutlet weak var tableView: UITableView!
    
    var cellName = ["Mathematics", "Marvel Super Heroes", "Science"]
    var cellText = ["Remember algebra?", "Spiderman fan?", "Not zodiac based!"]
    var cellImage = ["mathIcon", "marvelIcon", "scienceIcon"]

    
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
    
}

