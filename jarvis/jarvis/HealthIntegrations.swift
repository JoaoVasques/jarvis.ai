//
//  HealthIntegrations.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 21/05/16.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import UIKit

class HealthIntegrations: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var selectedSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
