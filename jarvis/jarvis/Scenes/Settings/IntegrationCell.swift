//
//  IntegrationCell.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 13/12/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import UIKit

class IntegrationCell: UITableViewCell {

    @IBOutlet var _icon: UIImageView!
    @IBOutlet var _name: UILabel!
    @IBOutlet var _activeSwitch: UISwitch!
    
    var integrationInteractor: ActivateIntegrationInteractorBase = ActivateFitbitInteractor()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @IBAction func integrationChanged(_ sender: Any) {
        if _activeSwitch.isOn {
            log.info("is on")
            self.integrationInteractor.call(user_id: "")
        } else {
            log.info("is off")
        }
    }
}
