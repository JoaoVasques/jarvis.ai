//
//  GetIntegrationsInteractor.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 18/12/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import Foundation
import BrightFutures
import XCGLogger

protocol GetIntegrationsInteractorProtocol {
    func call(user_id: String) -> Array<Integration>
}

class GetIntegrationsInteractor :GetIntegrationsInteractorProtocol {
    
    private let integrationsGateway: IntegrationsGatewayProtocol
    
    init(integrationsGateway: IntegrationsGatewayProtocol) {
        self.integrationsGateway = integrationsGateway
    }

    // MARK: Business Logic
    func call(user_id: String) -> Array<Integration> {
        return self.integrationsGateway.getAllIntegrations(userId: user_id)
    }
}
