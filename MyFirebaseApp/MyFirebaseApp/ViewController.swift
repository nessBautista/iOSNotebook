//
//  ViewController.swift
//  MyFirebaseApp
//
//  Created by Nestor Hernandez on 12/11/18.
//  Copyright © 2018 Nestor Hernandez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class ViewController: UIViewController, FUIAuthDelegate {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnAccount: UIButton!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    var authUI: FUIAuth?
    var ref : DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers: [FUIAuthProvider] = [FUIGoogleAuth()]
        //authUI?.isSignInWithEmailHidden = true
        authUI?.providers = providers
        
        ref = Database.database().reference()
        
        if Auth.auth().currentUser != nil {
//            ref?.child("games").child("1").setValue(["name":"first-edited", "level":5])
//            ref?.child("games/1/score").setValue(10)
//            ref?.child("games/1/score").removeValue()
            ref?.child("games").childByAutoId().setValue(["name":"second", "score":20])
        }
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error == nil {
            btnLogin.setTitle("Logout", for: .normal)
        }
    }

    @IBAction func doCreateAccount(_ sender: Any) {
        if let email = txtEmail.text, let password = txtPassword.text {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                guard error == nil else {
                    print(error?.localizedDescription ?? "No error")
                    return
                }
                
                print(result?.user.email ?? "no email")
                print(Auth.auth().currentUser?.uid ?? "no userid")
            }
        }
    }
    
    @IBAction func doLogin(_ sender: Any) {
        if Auth.auth().currentUser == nil {
//            if let email = txtEmail.text, let password = txtPassword.text {
//                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//                    if error == nil {
//                        self.btnLogin.setTitle("Logout", for: .normal)
//                    }
//                }
//            }
            if let authVC = authUI?.authViewController() {
                present(authVC, animated: true, completion: nil)
            }
        } else{
            do {
                try Auth.auth().signOut()
                self.btnLogin.setTitle("Login", for: .normal)
            } catch {
                print("logout error")
            }
        }
    }
}

