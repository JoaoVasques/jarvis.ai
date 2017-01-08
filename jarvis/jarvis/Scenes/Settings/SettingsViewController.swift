//
//  SettingsViewController.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 13/12/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    private let getIntegrationsInteractor = GetIntegrationsInteractor(integrationsGateway: IntegrationsGateway.sharedInstance)
    
    private var integrations: Array<Integration> = Array<Integration>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.integrations = self.getIntegrationsInteractor.call(user_id: "")

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.integrations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IntegrationCell", for: indexPath) as! IntegrationCell
        let integration = integrations[indexPath.row]
        cell._name.text = integration.name
        cell._activeSwitch.isOn = integration.isActive
        cell._icon.image = UIImage(named: integration.imageName)
        
        switch integration.name {
        case "Fitbit":
            cell.integrationInteractor = ActivateFitbitInteractor()
        case "Facebook":
            cell.integrationInteractor = ActivateFacebookInteractor()
        case "Instagram":
            cell.integrationInteractor = ActivateInstagramInteractor()
        case "Spotify":
            cell.integrationInteractor = ActivatesSpotifyInteractor()
        default:
            cell.integrationInteractor = ActivateFitbitInteractor()
            
        }
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Integrations"
        //return "Section \(section)"
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
