//
//  ResultViewController.swift
//  TriviaApps
//
//  Created by DSMacbook on 30/10/19.
//  Copyright © 2019 DSMacbook. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var gradeLabel: UILabel!
    var grade = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        gradeLabel.text = grade
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToHomeAct(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(newViewController, animated: true, completion: nil)
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
