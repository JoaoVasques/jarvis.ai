//
//  ActivateIntegrationInteractorBase.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 31/12/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import Foundation
import BrightFutures
import OAuthSwift

protocol ActivateIntegrationInteractorBase {
    var oauth: OAuth2Swift { get }
    
    var callBackUrl: String { get }
    var scope: String { get }
    var state: String { get }

    func handleSuccess(credential: OAuthSwiftCredential) -> Void
    func handleFailure(error: Error) -> Void
    
    func call(user_id: String) -> Void
}

extension ActivateIntegrationInteractorBase {
    func call(user_id: String) -> Void {
        self.oauth.authorize(
            withCallbackURL: URL(string: callBackUrl)!,
            scope: self.scope,
            state: self.state,
            success: {credential, response, parameters in
                self.handleSuccess(credential: credential)
            },
            failure: {error in self.handleFailure(error: error) }
        )
    }
}
