//
//  UserGateway.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 20/11/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import Foundation
import Alamofire
import BrightFutures
import Result

enum GatewayError: Error {
    case InternalServer
}

protocol UserGatewayProtocol {

    func createUser(user: User) -> Future<NSDictionary, GatewayError>
}

class UserGateway : UserGatewayProtocol {

    private let userApiEndpoint: String

    init(endpoint: String) {
        self.userApiEndpoint = endpoint
    }

    func createUser(user: User) -> Future<NSDictionary, GatewayError> {
        let promise = Promise<NSDictionary, GatewayError>()

        let endpoint = "\(userApiEndpoint)/user"
        let body = [
            "name": user.name,
            "twitter_user_id": user.twitterId,
            "oauth_token": user.oauthToken,
            "oauth_token_secret": user.oauthSecret
        ]

        Alamofire.request(endpoint, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseJSON {response in
            if(response.result.isSuccess) {
                promise.success(response.result.value as! NSDictionary)
            }
            else {
                promise.failure(GatewayError.InternalServer)
            }
        }

        return promise.future
    }

}
