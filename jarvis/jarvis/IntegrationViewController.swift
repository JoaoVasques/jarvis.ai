//
//  IntegrationViewController.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 22/05/16.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import UIKit

class IntegrationViewController: UITableViewController {

    //MARK properties
    var integrations = [Integration]()
    
    func loadDefaultIntegrations() {
        //TODO load data from server
        let fitbitIntegration = Integration(name: "Fitbit", photo: UIImage(named: "Fitbit")!, selected: false)
        let movesIntegration = Integration(name: "Moves", photo: UIImage(named: "Moves")!, selected: false)
        let myFitnesPalIntegration = Integration(name: "MyFitnessPal", photo: UIImage(named: "MyFitnessPal")!, selected: false)
        integrations += [fitbitIntegration, movesIntegration, myFitnesPalIntegration]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaultIntegrations()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return integrations.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "HealthIntegrations"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! HealthIntegrations

         //Configure the cell...
        // Fetches the appropriate meal for the data source layout.
        let integration = integrations[indexPath.row]
        
        cell.nameLabel.text = integration.name
        cell.iconImageView.image = integration.photo
        cell.selectedSwitch.on = integration.selected

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
