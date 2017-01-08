//
//  Integration.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 18/12/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import Foundation

enum IntegrationType {
    case social, health, work, music, finance
}

class Integration {
    let name: String
    let isActive: Bool
    let imageName: String
    let type: IntegrationType
    
    init(name: String, isActive: Bool, imageName: String, type: IntegrationType) {
        self.name = name
        self.isActive = isActive
        self.imageName = imageName
        self.type = type
    }
}
