//
//  ActivateInstagramInteractor.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 07/01/2017.
//  Copyright © 2017 xyz.joaovasques. All rights reserved.
//

import Foundation
import BrightFutures
import XCGLogger
import OAuthSwift

class ActivateInstagramInteractor :ActivateIntegrationInteractorBase {
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
            consumerKey:    "4e05cbc35a6f40c78e4dd7ce353a4b6f",
            consumerSecret: "1155507f0f594dbca7c313d6c8d3856b",
            authorizeUrl:   "https://api.instagram.com/oauth/authorize",
            responseType:   "token"
        )
        
        self.callBackUrl = "jarvis://instagram/oauth/callback"
        self.scope = "basic+public_content+follower_list+comments+relationships+likes"
        self.state = "INSTAGRAM"
    }
}
