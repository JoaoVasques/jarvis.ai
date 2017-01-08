//
//  ActivateFitbitInteractor.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 24/12/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import Foundation
import BrightFutures
import XCGLogger
import OAuthSwift

class ActivateFitbitInteractor :ActivateIntegrationInteractorBase {
    var oauth: OAuth2Swift
    
    var callBackUrl: String
    var scope: String
    var state: String
    
    func handleSuccess(credential: OAuthSwiftCredential) -> Void {
        print(credential)
    }
    
    func handleFailure(error: Error) -> Void {
        print(error.localizedDescription)
    }
    

    init() {
        self.oauth = OAuth2Swift(
            consumerKey:    "227RK5",
            consumerSecret: "f0da9dc73f765119ca1bd4b2da63ee15",
            authorizeUrl:   "https://www.fitbit.com/oauth2/authorize",
            responseType:   "token"
        )
        
        self.callBackUrl = "jarvis://fitbit/oauth/callback"
        self.scope = "activity heartrate location nutrition profile settings sleep social weight"
        self.state = "Fitbit"
    }
}
