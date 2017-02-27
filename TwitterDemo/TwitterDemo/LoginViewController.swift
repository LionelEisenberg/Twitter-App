//
//  LoginViewController.swift
//  TwitterDemo
//
//  Created by CS Student on 2/22/17.
//  Copyright © 2017 LionelEisenberg. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    @IBAction func onLoginButton(_ sender: Any) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: URL(string: "https://api.twitter.com")!, consumerKey: "V9cavqEZrvQDNW37feGJMhsqS", consumerSecret: "dWgDUZeIPxVeO82xRF0Dcav7AlKZX5f1NPhYOcd0LYoc1kxz3B")
        
        twitterClient?.deauthorize()
        twitterClient?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: nil, scope: nil, success: { (requestToken: BDBOAuth1Credential?) -> Void in
            print("Got request Token")
            
            let RToken = "\(requestToken?.token)"
            print("\(RToken)")
            let url = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(RToken)")
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }, failure: { (error: Error?) in
            print("error")
        })
        
       
        
    }
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
