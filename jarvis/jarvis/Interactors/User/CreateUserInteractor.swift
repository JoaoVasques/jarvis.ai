//
//  CreateUserInteractor.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 20/11/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import Foundation
import BrightFutures
import XCGLogger

protocol CreateUserInteractorProtocol {
    func call(user: User) -> Future<NSDictionary, GatewayError>
}

class CreateUserInteractor :CreateUserInteractorProtocol {

    private let userGateway: UserGatewayProtocol

    init(userGateway: UserGatewayProtocol) {
        self.userGateway = userGateway
    }

    // MARK: Business Logic
    func call(user: User) -> Future<NSDictionary, GatewayError> {
        log.info("Creating user with name \(user.name)")
        return userGateway.createUser(user: user)
    }
}
