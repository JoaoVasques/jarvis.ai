//
//  IntegrationsGateway.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 18/12/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import RealmSwift
import BrightFutures
import XCGLogger

protocol IntegrationsGatewayProtocol {
    
    func getAllIntegrations(userId: String) -> Array<Integration>
}

class IntegrationsGateway : IntegrationsGatewayProtocol {
    
    static let sharedInstance = IntegrationsGateway()
    
    let realm: Realm
    
    private init() {
        self.realm = try! Realm()
    }
    
    func getAllIntegrations(userId: String) -> Array<Integration> {
        let dummyIntegrations = [
            Integration(name: "Fitbit", isActive: false, imageName: "Fitbit"),
            Integration(name: "Facebook", isActive: false, imageName: "Facebook"),
            Integration(name: "Instagram", isActive: false, imageName: "Instagram"),
            Integration(name: "Twitter", isActive: false, imageName: "Twitter"),
            Integration(name: "Spotify", isActive: false, imageName: "Spotify"),
            Integration(name: "Google", isActive: false, imageName: "Google"),
            Integration(name: "Github", isActive: false, imageName: "Github"),
            Integration(name: "Paypal", isActive: false, imageName: "PayPal")

        ]
        //TODO
        return dummyIntegrations
    }
}
