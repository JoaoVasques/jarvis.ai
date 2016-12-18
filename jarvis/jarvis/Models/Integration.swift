//
//  Integration.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 18/12/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import Foundation

class Integration {
    let name: String
    let isActive: Bool
    let imageName: String
    
    init(name: String, isActive: Bool, imageName: String) {
        self.name = name
        self.isActive = isActive
        self.imageName = imageName
    }
}
