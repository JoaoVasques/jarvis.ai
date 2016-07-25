//
//  Integration.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 22/05/16.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import Foundation
import UIKit

class Integration {
    // MARK: Properties
    
    var name: String
    var photo: UIImage
    var selected: Bool
    
    init(name: String, photo: UIImage, selected: Bool) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.selected = selected
    }
}
