//
//  ActivateFacebookInteractor.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 07/01/2017.
//  Copyright © 2017 xyz.joaovasques. All rights reserved.
//

import Foundation
import BrightFutures
import XCGLogger
import OAuthSwift

class ActivateFacebookInteractor :ActivateIntegrationInteractorBase {
    var oauth: OAuth2Swift
    
    var callBackUrl: String
    var scope: String
    var state: String
    
    func handleSuccess(credential: OAuthSwiftCredential) -> Void {
        print(credential.oauthToken)
    }
    
    func handleFailure(error: Error) -> Void {
        print(error.localizedDescription)
    }
    
    init() {
        self.oauth = OAuth2Swift(
            consumerKey:    "1805714043041488",
            consumerSecret: "ee094d5aa9a0be1e6653bec0490d282b",
            authorizeUrl:   "https://www.facebook.com/dialog/oauth",
            responseType:   "token"
        )
        
        self.callBackUrl = "jarvis://"
        self.scope = "public_profile"
        self.state = "FACEBOOK"
    }
}
