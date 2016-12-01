//
//  UserInternalGateway.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 27/11/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import Foundation
import RealmSwift

protocol UserInternalGatewayProtocol {

    func createUser(user: User) -> Void
    func find() -> User?
}

class UserInternalGateway : UserInternalGatewayProtocol {

    static let sharedInstance = UserInternalGateway()

    let realm: Realm

    private init() {
        self.realm = try! Realm()
    }

    func createUser(user: User) -> Void {
        if let userOptional = self.find() {
            self.realm.delete(userOptional)
        }

        try! self.realm.write {
            self.realm.add(user)
        }
    }

    func find() -> User? {
        return self.realm.objects(User.self).first
    }
}
