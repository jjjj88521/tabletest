//
//  TableViewController.swift
//  tabletest
//
//  Created by NDHU_CSIE on 2020/11/5.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var name = ["watermelon", "apple", "orange", "strawberry", "pear"]
    var price = ["500", "100", "90", "200", "150"]
    var image = ["fruit", "fruit", "fruit", "fruit", "fruit"]
    var priceint = [500, 100, 90, 200, 150]
    var sum = 0
    
    @IBOutlet weak var output: UILabel!
    
    var fruitIsVisited = Array(repeating: false, count: 5)
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do ?", preferredStyle: .actionSheet)
        
        let checkInAction = UIAlertAction(title: "Select", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.fruitIsVisited[indexPath.row] = true
            
            if self.fruitIsVisited[indexPath.row]{
                
                self.sum += self.priceint[indexPath.row]
                self.output.text = "Total price = " + String(self.sum)
            }
        })
        
        optionMenu.addAction(checkInAction)
        
        let UndoCheckInAction = UIAlertAction(title: "Unselect", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            
            if self.fruitIsVisited[indexPath.row]{
                
                cell?.accessoryType = .none
                self.fruitIsVisited[indexPath.row] = false
                self.sum -= self.priceint[indexPath.row]
                self.output.text = "Total price = " + String(self.sum)
            }
        })
        
        optionMenu.addAction(UndoCheckInAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        present(optionMenu, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)
        
        output.text = "Total price = " + String(sum)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return name.count
    }
    


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as!TableViewCell
        
        
        
        // Configure the cell...
        cell.name?.text = name[indexPath.row]
        cell.price.text = price[indexPath.row]
        cell.fruitImage.image = UIImage(named: image[indexPath.row])
        if fruitIsVisited[indexPath.row] {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }

        return cell
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
