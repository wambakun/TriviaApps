//
//  ListTriviaController.swift
//  TriviaApps
//
//  Created by DSMacbook on 27/10/19.
//  Copyright © 2019 DSMacbook. All rights reserved.
//

import UIKit

class ListTriviaController: UITableViewController {

    @IBOutlet var tableViews: UITableView!
    
    var imgarr = [UIImage(named: "Image-5"),UIImage(named: "Image-6"),UIImage(named: "Image-7"),UIImage(named: "Image-8"),UIImage(named: "Image-9"),UIImage(named: "Image-10")]
    var namaText = ["Entertaiment: Games", "Entertaiment: Film", "Computer Science","General Knowledge","Entertaiment: Music","Entertaiment: TV"]
    var myIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imgarr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.images = imgarr[indexPath.item]
        cell.title = namaText[indexPath.item]
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc =  storyboard?.instantiateViewController(identifier: "DetailTriviaController") as? DetailTriviaController
        vc?.name = namaText[indexPath.item]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
