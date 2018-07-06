//
//  LoadViewController.swift
//  bnc10
//
//  Created by Ramón HC on 1/7/18.
//  Copyright © 2018 Ramón HC. All rights reserved.
//

import UIKit
import Firebase

class LoadViewController: UIViewController {
    
    // var databaseRef: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*databaseRef = Database.database().reference()
        let user = Auth.auth().currentUser
        let userID = user?.uid
        Alert.showAlert(title: "UID", message: userID!, vc: self)
        print(userID!)
        databaseRef?.child("users").child(userID!).setValue(["email": user?.email])
        databaseRef?.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let name = value?["email"] as? String ?? ""
            
            print(name)
            // let user = User(username: username)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }*/
    }

    override func viewDidAppear(_ animated: Bool) {
        print("hei hei hei hei")
        if AuthService.getSession() != nil {
            print("hei hei hei hei 1")
            self.performSegue(withIdentifier: "segueLoggedValidateSession", sender: nil)
        } else {
            print("hei hei hei hei 2")
            self.performSegue(withIdentifier: "noLoggedOnboarding", sender: nil)
        }
        
            
        /*let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "onboardingViewController") as! OnboardingViewController
        present(vc, animated: true, completion: nil)*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
