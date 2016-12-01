//
//  SaveUserInteractor.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 26/11/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import Foundation
import XCGLogger

protocol SaveUserInteractorProtocol {
    func call(user: User) -> Void
}

class SaveUserInteractor :SaveUserInteractorProtocol {

    private let userInternalGateway: UserInternalGatewayProtocol

    init(gateway: UserInternalGatewayProtocol) {
        self.userInternalGateway = gateway
    }

    // MARK: Business Logic
    func call(user: User) -> Void {
        log.info("Persisting on local database user with name \(user.name)")
        self.userInternalGateway.createUser(user: user)
    }
}
