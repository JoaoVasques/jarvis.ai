//
//  User.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 26/11/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import Foundation
import RealmSwift

class User : Object {
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var twitterId: String = ""
    dynamic var oauthToken: String = ""
    dynamic var oauthSecret: String = ""
    dynamic var userApiToken: String = ""
}
