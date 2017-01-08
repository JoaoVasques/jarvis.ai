//
//  ActivateSpotifyInteractor.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 07/01/2017.
//  Copyright © 2017 xyz.joaovasques. All rights reserved.
//


import Foundation
import BrightFutures
import XCGLogger
import OAuthSwift


class ActivatesSpotifyInteractor :ActivateIntegrationInteractorBase {
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
            consumerKey:    "8ee7bd9bb5f14df9b0a9ced4953321ad",
            consumerSecret: "bf2e969ad0244b1e811380d1b00ec13f",
            authorizeUrl:   "https://accounts.spotify.com/authorize",
            responseType:   "token"
        )
        
        self.callBackUrl = "jarvis://" //spotify/oauth/callback"
        self.scope = "streaming+user-top-read+"
        self.state = ""
    }
}
