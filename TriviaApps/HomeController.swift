//
//  HomeController.swift
//  TriviaApps
//
//  Created by DSMacbook on 27/10/19.
//  Copyright © 2019 DSMacbook. All rights reserved.
//

import UIKit
import Alamofire
class HomeController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

func loadData(){
      
       Alamofire.request("https://opentdb.com/api.php?amount=10", method: .get,encoding: JSONEncoding.default, headers: nil).responseJSON {
                      response in
                      print(response)
                      switch response.result {
                      case .success:
                           if let jsonarray = response.result.value as? [[String: Any]] {
       //
                           }
                      case .failure(let error):
                          print(error)
                      }
           }
   }
