//
//  LoginViewController.swift
//  jarvis
//
//  Created by Joao Luis Vazao Vasques on 05/11/2016.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import UIKit
import OAuthSwift
import BrightFutures

class LoginViewController: UIViewController {

    @IBOutlet weak var TwitterLogin: UIButton!

    private let createUserInteractor = CreateUserInteractor(userGateway: UserGateway(endpoint: "USER API ENDPOINT"))
    private let saveUserInteractor = SaveUserInteractor(gateway: UserInternalGateway.sharedInstance)
    private let findUserInteractor = FindUserInteractor(gateway: UserInternalGateway.sharedInstance)

    // create an instance and retain it
    let oauthswift = OAuth1Swift(
        consumerKey:    "",
        consumerSecret: "",
        requestTokenUrl: "https://api.twitter.com/oauth/request_token",
        authorizeUrl:    "https://api.twitter.com/oauth/authorize",
        accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = findUserInteractor.call() {
            goToHome(userId: user.id)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func goToHome(userId: String) -> Void {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVc: UIViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as UIViewController
        self.present(homeVc, animated: true, completion: nil)
    }

    @IBAction func OnTwitterLogin(_ sender: Any, forEvent event: UIEvent) {
        oauthswift.authorize(
            withCallbackURL: URL(string: "jarvis://twitter")!,
            success: { credential, response, parameters in
                print(parameters)
                let user = User()
                user.name = parameters["screen_name"]! as! String
                user.twitterId = parameters["user_id"]! as! String
                user.oauthToken = parameters["oauth_token_secret"]! as! String
                user.oauthSecret = parameters["oauth_token"]! as! String

                self.createUserInteractor.call(user: user)
                    .onSuccess {response in
                        log.info(response)
                        user.userApiToken = response.object(forKey: "api_token") as! String
                        user.id = response.object(forKey: "user_id") as! String
                        self.saveUserInteractor.call(user: user)
                        self.goToHome(userId: user.userApiToken)
                }
        },
            failure: { error in
                print(error.localizedDescription)
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
