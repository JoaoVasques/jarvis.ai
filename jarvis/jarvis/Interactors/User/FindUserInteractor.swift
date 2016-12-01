//
//  FindUserInteractor.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 27/11/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//


import Foundation
import XCGLogger

protocol FindUserInteractorProtocol {
    func call() -> User?
}

class FindUserInteractor :FindUserInteractorProtocol {

    private let userInternalGateway: UserInternalGatewayProtocol

    init(gateway: UserInternalGatewayProtocol) {
        self.userInternalGateway = gateway
    }

    // MARK: Business Logic
    func call() -> User? {
        return self.userInternalGateway.find()
    }
}
